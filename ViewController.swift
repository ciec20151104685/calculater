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
    //label只能显示不能操作
    var userIsInMiddleOfTypeingANumber: Bool = false
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        //发送按钮的title
        if userIsInMiddleOfTypeingANumber {
            display.text=display.text!+digit
        }
        else
        {
            display.text = digit
            userIsInMiddleOfTypeingANumber=true
        }
        
      
    }
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleOfTypeingANumber{
            enter()
        }
        switch operation {
        case "X":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
        case "+":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
        case "-":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() - operandStack.removeLast()
                enter()
            }
        case "/":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() / operandStack.removeLast()
                enter()
            }
        default:
            break
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

    
