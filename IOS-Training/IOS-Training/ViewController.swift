//
//  ViewController.swift
//  IOS-Training
//
//  Created by Sherwin Lauronilla Villaver on 11/04/2018.
//  Copyright © 2018 Sherwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBAction func btnNumber(_ sender: UIButton) {
        if performingMath == true {
            numberLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(numberLabel.text!)!
            performingMath = false
        } else {
            numberLabel.text = numberLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(numberLabel.text!)!
        }
    }
    
    @IBAction func btnOperator(_ sender: UIButton) {
        if numberLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(numberLabel.text!)!
            numberLabel.text = ""
            operation = sender.tag
            performingMath = true;
        } else if sender.tag == 16 {
            if operation == 12 {
                numberLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 13 {
                numberLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 14 {
                numberLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 15 {
                numberLabel.text = String(previousNumber + numberOnScreen)
            }
        } else if sender.tag == 11 {
            numberLabel.text = ""
            previousNumber = 0;
            numberOnScreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

