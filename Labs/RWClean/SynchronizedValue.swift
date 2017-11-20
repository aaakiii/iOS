import Foundation

public class SynchronizedValue<ValueType: Any> {
    
    private let queue = DispatchQueue(
        label: "SynchronizedValue(\(type(of: ValueType.self))",
        attributes: .concurrent)
    private var backingValue: ValueType
    // MARK: - Object　Lifecycle
    public init(_ value: ValueType) {
        self.backingValue = value
        
    }
    // MARK: - Safe Accessors
    public func get() -> ValueType {
        var value: ValueType!
        queue.sync { value = backingValue }
        return value
    }
    public func set(_ closure: (inout ValueType) -> ()) {
        queue.sync(flags: .barrier){ closure(&backingValue) }
        
    }
    // MARK: - Unsafe Accessors
    public var unsafeValue: ValueType {
        get{ return backingValue }
        set { backingValue = newValue }
        
    }
    public func setUnsafeValue(_ closure: (inout ValueType) -> ()) {
        closure(&backingValue)
        
    }
}
