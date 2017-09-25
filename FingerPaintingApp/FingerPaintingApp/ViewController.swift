//
//  ViewController.swift
//  FingerPaintingApp
//
//  Created by 岡田暁 on 2017-09-22.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var canvasView : CanvasView!
    var selectedColor : UIButton?
    var clearButton : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        let redImage = UIImage(named: "Red") as UIImage?
        let redBtn = UIButton(frame: CGRect(x:30,y:(self.view.frame.size.height - 50), width:40, height:40))
        redBtn.setImage(redImage, for: .normal)
        redBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        redBtn.tag = 1
        redBtn.backgroundColor = UIColor.red
        self.view.addSubview(redBtn)
        
        let blueImage = UIImage(named: "Blue") as UIImage?
        let blueBtn = UIButton(frame: CGRect(x:80,y:(self.view.frame.size.height - 50), width:40, height:40))
        blueBtn.setImage(blueImage, for: .normal)
        blueBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        blueBtn.tag = 2
        self.view.addSubview(blueBtn)
        blueBtn.backgroundColor = UIColor.blue
        
        let yellowImage = UIImage(named: "Yellow") as UIImage?
        let yellowBtn = UIButton(frame: CGRect(x:130,y:(self.view.frame.size.height - 50), width:40, height:40))
        yellowBtn.setImage(yellowImage, for: .normal)
        yellowBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        yellowBtn.tag = 3
        yellowBtn.backgroundColor = UIColor.yellow
        self.view.addSubview(yellowBtn)
        
        
        let eraseImage = UIImage(named: "Eraser") as UIImage?
        let eraseBtn = UIButton(frame: CGRect(x:180,y:(self.view.frame.size.height - 50), width:40, height:40))
        eraseBtn.setImage(eraseImage, for: .normal)
        eraseBtn.addTarget(self, action:#selector(self.eraseButtonTapped), for:.touchUpInside)
        eraseBtn.tag = 4
        self.view.addSubview(eraseBtn)
        print("yes")
    
        
        
    }
    
    func eraseButtonTapped(button: UIButton) {
        self.canvasView.clear()
    }

    func onClick(_ sender: AnyObject){
        let button = sender as! UIButton
        print("sender.tag:\(button.tag)")
        
//        if let picker = self.selectedColorPicker {
//            picker.layer.shadowRadius = 0
//        }
//        self.selectedColorPicker = button
        button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        
        self.canvasView.currentColor = button.backgroundColor!
    
    }



}

