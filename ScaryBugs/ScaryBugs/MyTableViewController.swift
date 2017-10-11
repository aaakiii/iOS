//
//  MytableView.swift
//  ScaryBugs
//
//  Created by 岡田暁 on 2017-09-26.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class MyTableViewController:UITableViewController {
    
    var scaryBugs = ScaryBugSet.bugsSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ScaryBugs"
        navigationItem.rightBarButtonItem = editButtonItem
        // all rows are selectable
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return scaryBugs.count
    }
    
    // add row original + 1
    override func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adj = isEditing ? 1 : 0
        return scaryBugs[section].bugs.count + adj
    }
    
    // insert row when it's editing mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            tableView.beginUpdates()
            for (index, set) in scaryBugs.enumerated() {
                let indexPath =  IndexPath(row: set.bugs.count, section: index)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            tableView.endUpdates()
        }else {
            tableView.beginUpdates()
            for (index, set) in scaryBugs.enumerated() {
                let indexPath =  IndexPath(row: set.bugs.count, section: index)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            tableView.endUpdates()
        }
        
    }
    
    // set icon
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let lastRow = scaryBugs[indexPath.section].bugs.count
        if indexPath.row >= lastRow {
            return .insert
        }else {
            return .delete
        }
    }
    
    
    
    override func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let set =  scaryBugs[indexPath.section]
        let imageView = cell.viewWithTag(1) as! UIImageView
        let label1 = cell.viewWithTag(2) as! UILabel
        let label2 = cell.viewWithTag(3) as! UILabel
        let imageView2 = cell.viewWithTag(4) as! UIImageView
        
        if indexPath.row == set.bugs.count && isEditing {
            label1.text = "ADD Item"
            label2.text = nil
            imageView.image = nil
            imageView2.image = nil
        }else{
            imageView.image = set.bugs[indexPath.row].image
            label1.text = "\(set.bugs[indexPath.row].name)"
            label2.text = "\(set.bugs[indexPath.row].howScary)"
            if set.bugs[indexPath.row].howScary == .QuiteScary || set.bugs[indexPath.row].howScary == .Aiiiiieeeee {
                imageView2.image = UIImage(named:"shockedface2_full")!
            }else {
                imageView2.image = UIImage(named:"shockedface2_empty")!
                
            }
            
        }
        return cell
    }
    
    // override selectable row
     override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if isEditing && indexPath.row < scaryBugs[indexPath.section].bugs.count {
            return nil
        }        
        return indexPath
    }
    // after row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row >= scaryBugs[indexPath.section].bugs.count && isEditing {
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return scaryBugs[section].name
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // when user tapped editing mode
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            scaryBugs[indexPath.section].bugs.remove(at: indexPath.row)
            tableView.reloadData()
        }else if editingStyle == .insert {
            let newBug = ScaryBug(withName: "New Bug", imageName: nil, howScary: .AverageScary)
            scaryBugs[indexPath.section].bugs.append(newBug)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    // cell movable
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let set = scaryBugs[indexPath.section]
        if indexPath.row >= set.bugs.count {
            return false
        }else {
            return  true
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let removeRow = scaryBugs[sourceIndexPath.section].bugs.remove(at: sourceIndexPath.row)
        scaryBugs[destinationIndexPath.section].bugs.insert(removeRow, at: destinationIndexPath.row)
        
    }

    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.row  >= scaryBugs[proposedDestinationIndexPath.section].bugs.count {
            return IndexPath(row: scaryBugs[proposedDestinationIndexPath.section].bugs.count-1, section: proposedDestinationIndexPath.section)
        }else{
            return proposedDestinationIndexPath
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "GoToEdit" {
            let editViewController = segue.destination as? EditViewController
            //画像と名前をpass
        }
    }
   
}

//


