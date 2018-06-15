//
//  Constants.swift
//  TodoApp
//
//  Created by Lester  Padul on 14/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import Foundation

var todoList: [String]?

func saveData(todoList: [String]) {
    UserDefaults.standard.set(todoList, forKey: "todoList")
}
func fetchData() -> [String]? {
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String] {
        return todo
    } else {
        return nil
    }
}
