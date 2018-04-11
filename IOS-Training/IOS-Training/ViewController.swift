//
//  ViewController.swift
//  IOS-Training
//
//  Created by Sherwin Lauronilla Villaver on 11/04/2018.
//  Copyright © 2018 Sherwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func viewDidLoad() {
        if let name = UserDefaults.standard.value(forKey: "name") as? String {
            lblName.text = name
        }
        txtName.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            lblName.text = textField.text!
            UserDefaults.standard.set(textField.text!, forKey: "name")
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

