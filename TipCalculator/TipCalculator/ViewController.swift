//
//  ViewController.swift
//  TipCalculator
//
//  Created by Aki on 2017-10-11.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var adjustTipPercentage: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        adjustTipPercentage.addTarget(self, action: #selector(ViewController.onChangeValueMySlider(sender:)), for: UIControlEvents.valueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc internal func onChangeValueMySlider(sender: UISlider){
        let billAmount = Double(billAmountTextField.text!)
        let currentValue = Double(sender.value)
        let totalAmount = (1+currentValue/100)*billAmount!        
        tipAmountLabel.text = String(totalAmount)
        
    }


}

