//
//  EditViewController.swift
//  ScaryBugs
//
//  Created by 岡田暁 on 2017-09-28.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class EditViewController: UITableViewController {

    var scaryBug: ScaryBug?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let scaryBug = scaryBug else {return}
        if let bugImage = scaryBug.image {
            
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        guard let scaryBug = scaryBug else {return}
        if let bugImage =  scaryBug.image {
            scaryBug.image =  bugImage
            
        }
        if let title = titleTextField.text {
            scaryBug.title = title
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "GoToRating" {
            if let ratingViewController = segue.destination as? RatingTableViewController {
                // howScary レベルをpass
            
            }
        }
    }
    
    
    

}

extension EditViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
