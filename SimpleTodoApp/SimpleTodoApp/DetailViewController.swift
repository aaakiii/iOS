//
//  DetailViewController.swift
//  SimpleTodoApp
//
//  Created by 岡田暁 on 2017-10-16.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit
 var todoItem = [String]()

class DetailViewController: UIViewController,UITextFieldDelegate {
    
   
    @IBOutlet weak var toDoTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // save text of toDoTextField
    @IBAction func addButton(_ sender: Any) {
        todoItem.append(toDoTextField.text!)
        toDoTextField.text = ""
        UserDefaults.standard.set(toDoTextField, forKey: "todoList")
    }
    
    // Dismiss keyboard when user touched screen except keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // Dismiss keyboard when user tapped return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        toDoTextField.resignFirstResponder()
        return true
    }
  

    

}
