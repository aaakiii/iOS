//
//  RatingTableTableViewController.swift
//  ScaryBugs
//
//  Created by 岡田暁 on 2017-09-28.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class RatingTableTableViewController: UITableViewController {
    
    var bug: ScaryBug?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    func refresh(){
        for index in 0...ScaryFactor.TotalFactor.rawValue{
            let indexPath = IndexPath(row: index, section: 0)
            if let cell  = tableView.cellForRow(at: indexPath){
                cell.accessoryType = bug?.howScary.rawValue == index ? .checkmark : .none
            }
        }
    
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let howScary = ScaryFactor(rawValue: indexPath.row) else { return}
        bug?.howScary = howScary
        refresh()
        
    }

}
