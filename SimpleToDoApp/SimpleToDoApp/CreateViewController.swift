import UIKit
import RealmSwift

class CreateViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var toDoText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoText.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
        let newTodo = ToDo()
        // textFieldに入力したデータをnewTodoのtitleに代入
        newTodo.title = toDoText.text!
        // 上記で代入したテキストデータを永続化するための処理
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTodo)
                print("ToDo Saved")
            })
        }catch{
            print("Save is Faild")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.toDoText.resignFirstResponder()
        return true
    }


}
