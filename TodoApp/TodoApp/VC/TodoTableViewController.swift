//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Lester  Padul on 14/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import UIKit

var myIndex = 0
var status:String = "add"

class TodoTableViewController: UITableViewController {

    
    @IBOutlet var taskTable: UITableView!
    
    override func viewDidLoad() {
        taskTable.delegate = self
        taskTable.dataSource = self
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        taskTable.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let todo = todoList {
            return todo.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "todoCell")
        if let todo = todoList {
            cell.textLabel?.text = todo[indexPath.row]
        }
        return cell
    }
    
    //MARK: TableViewDelegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view,
            completion) in
            //TODO: Delete todo
            todoList?.remove(at: indexPath.row)
            self.taskTable.reloadData()
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "trash")
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Done") { (action, view,
            completion) in
            //TODO: Done todo
            let cell = self.taskTable.cellForRow(at: indexPath)!
            cell.contentView.backgroundColor = UIColor.green
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "check")
        action.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "showTask", sender: self)
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
