//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by 岡田暁 on 2017-09-21.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myLabel:UILabel = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 100))
        myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        myLabel.numberOfLines = 0
        myLabel.text = "Detail Page"
        
        view.addSubview(myLabel)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
