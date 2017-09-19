//
//  ViewController.swift
//  ProgrammaticView
//
//  Created by Derrick Park on 2017-05-24.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let framingView: UIView = UIView(frame: CGRect.zero)
    let squareButton: UIButton = UIButton(type: .system)
    let portraitButton: UIButton = UIButton(type: .system)
    let landscapeButton: UIButton = UIButton(type: .system)
    var framingViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var framingViewWidthConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    
    let purpleBox = UIView()
    let blue1Box = UIView()
    let blue2Box = UIView()
    let blue3Box = UIView()
    let orange1Box = UIView()
    let orange2Box = UIView()
    let redBox = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        squareButton.setTitle("Square", for: .normal)
        squareButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(squareButton)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitButton.setTitle("Portrait", for: .normal)
        portraitButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(portraitButton)
        portraitButton.translatesAutoresizingMaskIntoConstraints = false
        
        landscapeButton.setTitle("Landscape", for: .normal)
        landscapeButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(landscapeButton)
        landscapeButton.translatesAutoresizingMaskIntoConstraints = false
        
        framingView.translatesAutoresizingMaskIntoConstraints = false
        framingView.backgroundColor = UIColor.green
        view.addSubview(framingView)
        
        let buttonsHorizontalContraintsFormat = "|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|"
        
        let buttonsHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: buttonsHorizontalContraintsFormat, options: .alignAllCenterY, metrics: nil, views: ["squareButton":squareButton, "portraitButton":portraitButton, "landscapeButton":landscapeButton])
        
        NSLayoutConstraint.activate(buttonsHorizontalContraints)
        
        let squareButtonBottomConstraint = NSLayoutConstraint.init(item: squareButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -50.0)
        squareButtonBottomConstraint.isActive = true
        
        let framingViewCenterXContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterXContraint.isActive = true

        let framingViewCenterYContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterYContraint.isActive = true
        
        framingViewHeightConstraint = NSLayoutConstraint.init(item: framingView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewHeightConstraint.isActive = true
        
        framingViewWidthConstraint = NSLayoutConstraint.init(item: framingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewWidthConstraint.isActive = true
        
        initPurpleBox()
        initBlueBox()
        initRedBox()
        initOrangeBox()
    
    }
    
    func initPurpleBox(){
        purpleBox.backgroundColor = UIColor.purple
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(purpleBox)
        
        NSLayoutConstraint.init(item: purpleBox, attribute: .trailing, relatedBy: .equal, toItem: framingView, attribute: .trailing, multiplier: 1.0, constant: -20.0).isActive = true
        
        NSLayoutConstraint.init(item: purpleBox, attribute: .bottom, relatedBy: .equal, toItem: framingView, attribute: .bottom, multiplier: 1.0, constant: -20.0).isActive = true
        
        NSLayoutConstraint.init(item: purpleBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        
        NSLayoutConstraint.init(item: purpleBox, attribute: .width, relatedBy: .equal, toItem: framingView, attribute: .width, multiplier: 305/500, constant: 0).isActive = true
        
    }
    
    func initBlueBox(){
        blue1Box.backgroundColor = UIColor.blue
        blue1Box.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blue1Box)
        blue2Box.backgroundColor = UIColor.blue
        blue2Box.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blue2Box)
        blue3Box.backgroundColor = UIColor.blue
        blue3Box.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blue3Box)
        
        
        NSLayoutConstraint.init(item: blue1Box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint.init(item: blue1Box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        blue1Box.centerXAnchor.constraint(equalTo: framingView.centerXAnchor).isActive = true
        NSLayoutConstraint.init(item: blue1Box, attribute: .centerY, relatedBy: .equal, toItem: framingView, attribute: .centerY, multiplier: 0.5, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint.init(item: blue2Box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint.init(item: blue2Box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        blue2Box.centerXAnchor.constraint(equalTo: framingView.centerXAnchor).isActive = true
        blue2Box.centerYAnchor.constraint(equalTo: framingView.centerYAnchor).isActive = true
       
        
        NSLayoutConstraint.init(item: blue3Box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint.init(item: blue3Box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 50.0).isActive = true
        blue3Box.centerXAnchor.constraint(equalTo: framingView.centerXAnchor).isActive = true
        NSLayoutConstraint.init(item: blue3Box, attribute: .centerY, relatedBy: .equal, toItem: framingView, attribute: .centerY, multiplier: 1.5, constant: 0.0).isActive = true
        
    }
    
    
    func initRedBox(){
        
        redBox.backgroundColor = UIColor.red
        redBox.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(redBox)
        
        redBox.topAnchor.constraint(equalTo: framingView.topAnchor, constant: 20).isActive = true
        redBox.leadingAnchor.constraint(equalTo: framingView.trailingAnchor, constant: -170).isActive = true
        redBox.trailingAnchor.constraint(equalTo: framingView.trailingAnchor, constant: -20).isActive = true
        NSLayoutConstraint.init(item: redBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
    }
    
    func initOrangeBox(){
        orange1Box.backgroundColor = UIColor.orange
        orange1Box.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(orange1Box)
        orange2Box.backgroundColor = UIColor.orange
        orange2Box.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(orange2Box)
        
        orange1Box.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
        orange1Box.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -10).isActive = true
        orange1Box.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 10).isActive = true
        NSLayoutConstraint.init(item: orange1Box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70.0).isActive = true
        
        orange2Box.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
        orange2Box.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -10).isActive = true
        orange2Box.leadingAnchor.constraint(equalTo: orange1Box.trailingAnchor, constant: 10).isActive = true
        NSLayoutConstraint.init(item: orange2Box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
    }

    func resizeFramingView(_ sender: UIButton) {
        var newWidth: CGFloat = 0.0
        var newHeight: CGFloat = 0.0
        if (sender == self.squareButton) {
            newWidth = 500.0
            newHeight = 500.0
        } else if (sender == self.portraitButton) {
            newWidth = 350.0
            newHeight = 550.0
        } else if (sender == self.landscapeButton) {
            newWidth = 900.0
            newHeight = 300.0
        }
        
        UIView.animate(withDuration: 2.0) {
            self.framingViewHeightConstraint.constant = newHeight
            self.framingViewWidthConstraint.constant = newWidth
            self.view.layoutIfNeeded()
        }
    }
}

