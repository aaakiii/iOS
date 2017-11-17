//
//  ViewController.swift
//  TipCalculator
//
//  Created by Aki on 2017-10-11.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var adjustTipPercentage: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        adjustTipPercentage.addTarget(self, action: #selector(ViewController.onChangeValueMySlider(sender:)), for: UIControlEvents.valueChanged)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billAmountTextField.resignFirstResponder()
        return true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @objc func keyboardWillShow(notification: Notification){
    
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        print("Show")
        if self.view.frame.origin.y == 0{
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame.origin.y -= keyboardSize.size.height
            })
        }
    }

    }
    @objc func keyboardWillHide(notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("Hide")
            if self.view.frame.origin.y != 0{
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame.origin.y += keyboardSize.height
                })
            }
        }
    }
    
    @objc internal func onChangeValueMySlider(sender: UISlider){
        let billAmount = Double(billAmountTextField.text!)
        let currentValue = Double(sender.value)
        let totalAmount = (1+currentValue/100)*billAmount!        
        tipAmountLabel.text = String(totalAmount)
        
    }


}

