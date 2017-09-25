//
//  ViewController.swift
//  ScaryBugs
//
//  Created by 岡田暁 on 2017-09-25.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var table: UITableView!
    
    var scaryBugs:[ScaryBug]!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scaryBugs = ScaryBug.bugs()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return scaryBugs.count
        
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = scaryBugs[indexPath.row].image
        
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "\(scaryBugs[indexPath.row].name)"
        
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(scaryBugs[indexPath.row].howScary)"
        
        return cell
    }
    
}
