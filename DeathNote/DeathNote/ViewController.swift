import UIKit
import CoreData

class ViewController: UIViewController {
    var people = [NSManagedObject]()
    
    @IBOutlet weak var tableView: UITableView!
    // Getting delegate refference
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Death Note"
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Death")

    }
    
    // Fetch data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = appDelegate else{ return }
        let manageContext = appDelegate.persistantContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
          people = try manageContext.fetch(fetchRequest)
        } catch let error as NSError{
            print(error)
        }
    }
    
    //Save data
    func savePerson(name: String){
        guard let appDelegate = appDelegate else{ return }
        let manageContext = appDelegate.persistantContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: manageContext)!
        let person = NSManagedObject(entity: entity, insertInto: manageContext)
        person.setValue(name,forKey: "name")
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
         guard let personTextField = alertController.textFields?.first, let person = personTextField.text else
         {return}
            self.savePerson(name: person)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel)
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "Add here"
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Death", for: indexPath)
        let person = people[indexPath.row]
        cell .textLabel?.text = person.value(forKey: "name") as! String?
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
