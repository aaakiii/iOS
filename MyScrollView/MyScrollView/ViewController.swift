//
//  ViewController.swift
//  MyScrollView
//
//  Created by Aki on 2017-10-11.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MyScrollView.scrollView
    let myScrollView = MyScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // create main scroll view
        myScrollView.createView()
        mainView.frame = CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height)
        view.addSubview(mainView)
       
        // add red view
        let redView = UIView(frame: CGRect(x:20, y: 20,width: 100, height: 100))
        redView.backgroundColor = UIColor.red
        mainView.addSubview(redView)
        
        // add green view
        let greenView = UIView(frame: CGRect(x:150, y: 150,width: 150, height: 200))
        greenView.backgroundColor = UIColor.green
        mainView.addSubview(greenView)
        
        // add blue view
        let blueView = UIView(frame: CGRect(x: 40, y: 400, width: 200, height: 150))
        blueView.backgroundColor = UIColor.blue
        mainView.addSubview(blueView)
        
        // add yellow view
        let  yelloView = UIView(frame: CGRect(x:100, y: 600, width: 180, height: 150))
        yelloView.backgroundColor = UIColor.yellow
        mainView.addSubview(yelloView)

        
    }
    
}

