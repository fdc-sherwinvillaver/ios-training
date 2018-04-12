//
//  ViewController.swift
//  IOS-Training
//
//  Created by Sherwin Lauronilla Villaver on 11/04/2018.
//  Copyright © 2018 Sherwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var objects: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.objects.add("Sherwin")
        self.objects.add("Viollaver")
        self.objects.add("Lauronilla")
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = self.objects.object(at: indexPath.row) as? String
        cell.shareButton.tag = indexPath.row
        cell.shareButton.addTarget(self, action: #selector(self.logAction(_:)), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    @IBAction func logAction(_ sender: UIButton) {
        let titleString = self.objects.object(at: sender.tag) as? String
        
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [titleString as Any], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showView" {
            let upcoming: NewViewController = segue.destination as! NewViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let titleString = self.objects.object(at: indexPath.row) as? String
            
            upcoming.titleString = titleString
            
            self.tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
}

