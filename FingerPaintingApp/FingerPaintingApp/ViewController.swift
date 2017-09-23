//
//  ViewController.swift
//  FingerPaintingApp
//
//  Created by 岡田暁 on 2017-09-22.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        let redImage = UIImage(named: "Red") as UIImage?
        let redBtn = UIButton(frame: CGRect(x:30,y:(self.view.frame.size.height - 50), width:40, height:40))
        redBtn.setImage(redImage, for: .normal)
        redBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        redBtn.tag = 1
        self.view.addSubview(redBtn)
        
        let blueImage = UIImage(named: "Blue") as UIImage?
        let blueBtn = UIButton(frame: CGRect(x:80,y:(self.view.frame.size.height - 50), width:40, height:40))
        blueBtn.setImage(blueImage, for: .normal)
        blueBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        blueBtn.tag = 2
        self.view.addSubview(blueBtn)
        
        let yellowImage = UIImage(named: "Yellow") as UIImage?
        let yellowBtn = UIButton(frame: CGRect(x:130,y:(self.view.frame.size.height - 50), width:40, height:40))
        yellowBtn.setImage(yellowImage, for: .normal)
        yellowBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        yellowBtn.tag = 3
        self.view.addSubview(yellowBtn)
        
        
        let eraseImage = UIImage(named: "Eraser") as UIImage?
        let eraseBtn = UIButton(frame: CGRect(x:180,y:(self.view.frame.size.height - 50), width:40, height:40))
        eraseBtn.setImage(eraseImage, for: .normal)
        eraseBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        eraseBtn.tag = 4
        self.view.addSubview(eraseBtn)
    
        
        
    }

    func onClick(_ sender: AnyObject){
        let button = sender as! UIButton
        print("sender.tag:\(button.tag)")
       
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

