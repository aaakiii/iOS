//
//  ViewController.swift
//  CocopodsDemo
//
//  Created by 岡田暁 on 2017-09-22.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit
import Pastel
import DynamicButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pastelView = PastelView(frame: view.bounds)
        let dynamicButton = DynamicButton(style: .hamburger)
        dynamicButton.frame.origin.x = 200
        dynamicButton.frame.origin.y = 200
        pastelView.addSubview(dynamicButton)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

