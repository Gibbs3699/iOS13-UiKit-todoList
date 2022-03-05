//
//  TodoListViewController.swift
//  iOS13-UiKit-todoList
//
//  Created by admin on 5/3/2565 BE.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["To Do 1", "To Do 2", "To Do 3", "To Do 4", "To Do 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = item

        return cell
    }
    
}

