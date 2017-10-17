import UIKit
import RealmSwift

class CreateViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var toDoText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoText.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: Any) {
        let realm = try! Realm()
        
        let todo = ToDo()
        todo.title = toDoText.text!
        try! realm.write {
            realm.add(todo)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.toDoText.resignFirstResponder()
        return true
    }


}
