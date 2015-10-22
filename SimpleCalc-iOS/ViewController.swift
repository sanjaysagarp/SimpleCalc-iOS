//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by Sanjay Sagar on 10/21/15.
//  Copyright © 2015 Sanjay Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var num : String = ""
    var prev : Int = 0
    var operand : String = ""
    var result : Bool = false
    @IBOutlet weak var displayText: UILabel!
    
    @IBAction func Operand(sender: UIButton) {
        prev = Int(num)! // could add on from prev
        operand = sender.currentTitle!
        displayText.text = displayText.text! + " \(operand) "
        num = ""
    }
    
    @IBAction func Number(sender: UIButton) {
        //NSLog("The button pressed is \(sender.currentTitle!)")
        if result {
            result = false
            displayText.text = "0"
        }
        if (displayText != nil) {
            if (Int(displayText.text!) != 0) { // need to handle 1 + 0123
                num += sender.currentTitle!
                displayText.text = displayText.text! + sender.currentTitle!
            } else {
                displayText.text = sender.currentTitle!
                num = sender.currentTitle!
            }
        }
    }

    @IBAction func Calculate(sender: UIButton) {
        result = true
        var solution : Int = 0
        if operand == "+" {
            solution = prev + Int(num)!
        } else if operand == "-" {
            solution = prev - Int(num)!
        } else if operand == "*" {
            solution = prev * Int(num)!
        } else if operand == "/" {
            solution = prev / Int(num)!
        } else if operand == "%" {
            solution = prev % Int(num)!
        }
        displayText.text = displayText.text! + " = " + String(solution)
    }
    
    @IBAction func Clear(sender: UIButton) {
        result = false
        displayText.text = "0"
    }
    
    // Need to implement extended operations
    
}

