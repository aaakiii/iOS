import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {
    var todoItem: Results<ToDo>!
    var valueToPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "To Do List"
        do{
            let realm = try Realm()
            todoItem = realm.objects(ToDo.self)
            tableView.reloadData()
        }catch{
        }
    }    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return todoItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = todoItem[indexPath.row]
        cell.textLabel?.text = object.title
        return cell
    }
    
    // Tapped row and show detailView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row)selected")
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        valueToPass = currentCell.textLabel?.text
    }
    
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "detailView") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! DetailViewController
            // your new view controller should have property that will store passed value
            viewController.toDoText.text = valueToPass
        }
    }

    // delete item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.todoItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
            }catch{
            }
            tableView.reloadData()
        }
    }
    
}
