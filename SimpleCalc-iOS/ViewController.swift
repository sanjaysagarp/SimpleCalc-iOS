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
    var prev : Double = 0
    var operand : String = ""
    var result : Bool = false
    var arrOperand = [String]()
    var arrNum = [Double]()
    var solution : Double = 0
    var decimal : Bool = false
    
    @IBOutlet weak var displayText: UILabel!
    
    @IBAction func Operand(sender: UIButton) {
        if result {
            result = false
            displayText.text = String(solution)
            arrNum.append(solution)
            arrOperand.append(sender.currentTitle!)
            num = ""
        } else {
            arrNum.append(Double(num)!)
            arrOperand.append(sender.currentTitle!)
            num = ""
        }
        displayText.text = displayText.text! + " \(sender.currentTitle!) "
        
    }
    
    @IBAction func Number(sender: UIButton) {
        if result {
            result = false
            displayText.text = "0"
            num = ""
        }
        if displayText != nil {
            if Int(displayText.text!) != 0 {
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
        arrNum.append(Double(num)!)
        solution = 0;
        if(arrOperand[arrOperand.count - 1 ] == "count") {
            solution = Double(arrNum.count)
            arrNum = []
            arrOperand = []
        } else if arrOperand.count + 1 == arrNum.count {
            for var index = 0; index < arrOperand.count; index++ {
                operand = arrOperand[index]
                prev = arrNum[index]
                if operand == "+" {
                    solution += prev + arrNum[index + 1]
                } else if operand == "-" {
                    solution += prev - arrNum[index + 1]
                } else if operand == "*" {
                    if solution == 0 {
                        solution = prev
                    }
                    solution *= arrNum[index + 1]
                } else if operand == "/" {
                    if solution == 0 {
                        solution = prev
                    }
                    solution /= arrNum[index + 1]
                } else if operand == "%" {
                    if solution == 0 {
                        solution = prev
                    }
                    solution %= arrNum[index + 1]
                } else if operand == "avg" {
                    solution += prev
                }
            }
        } else if arrOperand[0] == "fact" {
            if arrNum.count == 1 {
                solution = fact(arrNum[0])
            }
        }
        if operand == "avg" {
            
            displayText.text = displayText.text! + " = " + String(round((Double(solution) / Double(arrNum.count)) * 100 / 100))
        } else if arrNum.count > 1 && operand == "fact" {
            displayText.text = displayText.text! + " = Err"
        } else if (solution * 100) % 100 != 0{
            displayText.text = displayText.text! + " = " + String(round(solution * 100) / 100)
        } else {
            displayText.text = displayText.text! + " = " + String(Int(round(solution)))
        }
        
        
        
        arrNum = []
        arrOperand = []
    }
    
    @IBAction func Clear(sender: UIButton) {
        arrNum = []
        arrOperand = []
        displayText.text = "0"
        num = ""
    }
    
    @IBAction func ExtensionOperands(sender: UIButton) {
        if result {
            result = false
            displayText.text = "0"
            num = ""
            displayText.text = String(solution)
        }
        if(sender.currentTitle == "count") {
            arrNum.append(Double(num)!)
            arrOperand.append(sender.currentTitle!)
            num = ""
        } else if(sender.currentTitle == "avg") {
            arrNum.append(Double(num)!)
            arrOperand.append(sender.currentTitle!)
            num = ""
        } else if sender.currentTitle == "fact" {
            arrOperand.append(sender.currentTitle!)
        }
        displayText.text = displayText.text! + " \(sender.currentTitle!) "
        
        }
    
    @IBAction func Decimal(sender: UIButton) {
        if !num.containsString(".") {
            num += "."
            displayText.text = displayText.text! + sender.currentTitle!
        }
    }
}

func fact(num:Double) -> Double {
    if (num == 0) {
        return 1
    } else {
        return num * fact(num-1)
    }
}
