//
//  NewViewController.swift
//  IOS-Training
//
//  Created by Sherwin Lauronilla Villaver on 12/04/2018.
//  Copyright © 2018 Sherwin. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.titleString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
