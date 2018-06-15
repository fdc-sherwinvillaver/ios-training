//
//  ShowTaskViewController.swift
//  TodoApp
//
//  Created by Lester  Padul on 15/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import UIKit

class ShowTaskViewController: UIViewController {

    @IBOutlet weak var lblTask: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTask.text = todoList![myIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateTask(_ sender: UIButton) {
        status = "update"
        performSegue(withIdentifier: "updateData", sender: self)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
