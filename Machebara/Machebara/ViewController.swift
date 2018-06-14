//
//  ViewController.swift
//  Machebara
//
//  Created by Lester  Padul on 13/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var dataSourceArray = [Actor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        let apiCall = APIManager.shared.fetchActorsFromApi()
        let _ = apiCall.done { promise in
            self.dataSourceArray = promise
            self.table.reloadData()
            }.catch{ error in
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorTableViewCell") as! ActorTableViewCell
        cell.actorName.text = dataSourceArray[indexPath.row].name!
        cell.actorBirthdate.text = dataSourceArray[indexPath.row].dob!
        cell.actorChildren.text = dataSourceArray[indexPath.row].children!
        cell.actorCountry.text = dataSourceArray[indexPath.row].country!
        cell.actorDescription.text = dataSourceArray[indexPath.row].description!
        cell.actorHeight.text = dataSourceArray[indexPath.row].height!
        let url = URL(string: dataSourceArray[indexPath.row].imageUrl!)
        cell.actorImage.af_setImage(withURL: url!)
        return cell
    }
    

}

