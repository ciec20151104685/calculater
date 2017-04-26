//
//  ViewController.swift
//  calculater
//
//  Created by singledog on 17/3/29.
//  Copyright © 2017年 singledog. All rights reserved.
//

import UIKit//导入ui框架 

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInMiddleOfTypeingANumber: Bool = false
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTypeingANumber {
            display.text=display.text!+digit
        }
        else
        {
            display.text = digit
            userIsInMiddleOfTypeingANumber=true
        }
        
      
    }
    var operandStack=Array<Double>()
    @IBAction func enter() {
        userIsInMiddleOfTypeingANumber=false
        operandStack.append(displayValue)
        print("operandStack=\(operandStack)")
        
    }
    var displayValue:Double{
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
            
        }
        set{
            display.text="\(newValue)"
            userIsInMiddleOfTypeingANumber=false
        }
    }
}

    
