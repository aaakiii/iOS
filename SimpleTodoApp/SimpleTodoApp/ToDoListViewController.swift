import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let todoCollection = realm.objects(ToDo.self)
        // Realmに保存されているTodo型のobjectsを取得。
        
        return todoCollection.count // 総todo数を返している
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todoCollection = realm.objects(ToDo.self)
        // Realmに保存されているTodo型のobjectsを取得。
        let todo = todoCollection[indexPath.row]
        cell.textLabel?.text = todo.title
        
        return cell
    }
    

    

}
