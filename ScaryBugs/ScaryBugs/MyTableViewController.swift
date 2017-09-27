//
//  MytableView.swift
//  ScaryBugs
//
//  Created by 岡田暁 on 2017-09-26.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class MyTableViewController:UITableViewController{
    
    var scaryBugs = ScaryBugSet.bugsSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ScaryBugs"
        navigationItem.rightBarButtonItem = editButtonItem
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return scaryBugs.count
    }
    
    
    override func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return scaryBugs[section].bugs.count
        
    }
    
    override func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let bug =  scaryBugs[indexPath.section].bugs[indexPath.row]
//        cell.textLabel?.text = bug.name
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = bug.image
        
        let label1 = cell.viewWithTag(2) as! UILabel
        label1.text = "\(bug.name)"
        
        let label2 = cell.viewWithTag(3) as! UILabel
        label2.text = "\(bug.howScary)"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return scaryBugs[section].name
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
          
            scaryBugs[indexPath.section].bugs.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

