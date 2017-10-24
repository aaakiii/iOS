import UIKit
import CoreData

class ViewController: UIViewController {
    var people = [Person]()
    
    @IBOutlet weak var tableView: UITableView!
    // Getting delegate refference
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Death Note"
        self.tableView.dataSource = self

    }
    
    // Fetch data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = appDelegate else{ return }
        let manageContext = appDelegate.persistantContainer.viewContext
        
        do {
          people = try manageContext.fetch(Person.fetchRequest())
        } catch let error as NSError{
            print(error)
        }
    }
    
    //Save data
    func savePerson(name: String, age: Int16, eyeColor: UIColor){
        guard let appDelegate = appDelegate else{ return }
        let manageContext = appDelegate.persistantContainer.viewContext
        let person = Person(entity: Person.entity(), insertInto: manageContext)
        person.name = name
        person.age = age
        person.eyeColor = eyeColor
        // commit
        do {
            // save as data and add array
            try manageContext.save()
            people.append(person)
        }catch let error as NSError {
            print(error)
        }
        
        
    }

    @IBAction func addPerson(_ sender: Any) {
        let alertController =  UIAlertController(title: "Death Note", message: "who's next?", preferredStyle: .alert)
        let saveAction = UIAlertAction(title:"SAVE", style: .default){(action) in
            guard let name = alertController.textFields?[0].text,
                  let ageString = alertController.textFields?[1].text,
                  let eyeColorString = alertController.textFields?[2].text,
                  let age = Int16(ageString) else {return}
            let eyeColor = self.eyeColorFromString(eyeColorString)
            self.savePerson(name: name, age: age, eyeColor: eyeColor)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel)
        alertController.addTextField()
        alertController.addTextField()
        alertController.addTextField()
        alertController.textFields?[0].placeholder = "Name"
        alertController.textFields?[1].placeholder = "Age"
        alertController.textFields?[2].placeholder = "Eye Color"
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func filter(_ sender: Any) {
        let alert = UIAlertController(title: "filter Options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Show All", style: .default, handler: {
            (action) in
            self.reloadData(over: true)
        }))
        alert.addAction(UIAlertAction(title: "Under 30", style: .default, handler: {
            (action) in
            
            self.reloadData(age: 30, over: false)
            
        }))
        alert.addAction(UIAlertAction(title: "Over 30", style: .default, handler: {
            (action) in
            self.reloadData(age: 30, over: true)
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func reloadData(age: Int16 = 0, over: Bool){
        guard let appDelegate = appDelegate else { return }
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        if age > 0 && over {
            fetchRequest.predicate = NSPredicate(format: "age >= %d", age)
        }else if age > 0 && !over {
            fetchRequest.predicate = NSPredicate(format: "age <= %d", age)
        }
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Person.name), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do{
            let fetchedPeople = try appDelegate.persistantContainer.viewContext.fetch(fetchRequest)
            people = fetchedPeople
            self.tableView.reloadData()
        } catch let error {
            print(error)
        }
    }
    // Change format of eye color
    func eyeColorFromString(_ eyeColor: String) -> UIColor{
        switch eyeColor {
        case  "Blue":
            return UIColor.blue
        case "Green":
            return UIColor.green
        case "Purple":
            return UIColor.purple
        default:
            return UIColor.brown
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Death", for: indexPath) as! DeathTableViewCell
        let person = people[indexPath.row]
        cell.setUpCell(age: person.age, name: person.name, eyeColor: (person.eyeColor as! UIColor?)!)

        return cell
    }
    
    // Delete data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            guard let appDelegate = appDelegate else{ return }
            let manageContext = appDelegate.persistantContainer.viewContext
            // delete from data
            manageContext.delete(people[indexPath.row])
            do{
                try manageContext.save()
            } catch let error as NSError{
                print(error)
            }
            
            // remove from table
            tableView.beginUpdates()
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
}
