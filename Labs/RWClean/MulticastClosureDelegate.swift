import Foundation


public class MulticastClosureDelegate<Success, Failure> {
    
    class Callback {
        let queue: DispatchQueue
        let success: Success
        let failure: Failure
        init(queue: DispatchQueue, success: Success, failure: Failure) {
            self.queue = queue
            self.success = success
            self.failure = failure
        }
    }
    
    internal var mapTable = SynchronizedValue (
        NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects()
    )
    
    public var count: Int {
        return getCallbacks(removeAfter: false).count
    }
    
    public func addClosurePair(for objectKey: AnyObject,
                               queue: DispatchQueue = .main,
                               success: Success,
                               failure: Failure){
        mapTable.set { mapTable in
            let callBack = Callback(queue: queue, success: success, failure: failure)
            let array = mapTable.object(forKey: objectKey) ?? NSMutableArray()
            array.add(callBack)
            mapTable.setObject(array, forKey: objectKey)
        }
    }
    
    public func getSuccessTuples(removeAfter: Bool = true) -> [(Success, DispatchQueue)] {
        return getCallbacks(removeAfter: removeAfter).map {
            return ($0.success, $0.queue)
        }
    }
    
   public func getFailureTuples(removeAfter: Bool = true) -> [(Failure, DispatchQueue)] {
    return getCallbacks(removeAfter: removeAfter).map {
        return ($0.failure, $0.queue)
        }
    
    }
    fileprivate func getCallbacks(removeAfter: Bool = true) -> [Callback] {
        var callBacks: [Callback]!
        mapTable.set { mapTable in
            let objects = mapTable.keyEnumerator().allObjects as [AnyObject]
            callBacks = objects.reduce([]) { (combinedArray, objectKey) in
                let array = mapTable.object(forKey: objectKey)! as! [Callback]
                return combinedArray + array
                
            }
            guard removeAfter else { return }
            objects.forEach { mapTable.removeObject(forKey: $0) }
            
        }
        return callBacks
        
    }
}



