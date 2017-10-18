//
//  DetailViewController.swift
//  SimpleToDoApp
//
//  Created by 岡田暁 on 2017-10-17.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dueDateText: UILabel!
    @IBOutlet weak var toDoText: UILabel!
    let toDoListViewController = ToDoListViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detail"

        toDoText.text = toDoListViewController.valueToPass
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
