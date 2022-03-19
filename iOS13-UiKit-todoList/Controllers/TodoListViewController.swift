//
//  TodoListViewController.swift
//  iOS13-UiKit-todoList
//
//  Created by admin on 5/3/2565 BE.
//

import UIKit

class TodoListViewController: UITableViewController {

//    var itemArray = ["To Do 1", "To Do 2", "To Do 3", "To Do 4", "To Do 5", "To Do 6", "To Do 7", "To Do 8", "To Do 9", "To Do 10", "To Do 11", "To Do 12", "To Do 13", "To Do 14", "To Do 15", "To Do 16", "To Do 17", "To Do 18", "To Do 19", "To Do 20", "To Do 21", "To Do 22", "To Do 23", "To Do 24", "To Do 25", "To Do 26", "To Do 27", "To Do 28", "To Do 29", "To Do 30"]
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let item = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = item
//        }
//        tableView.dataSource = self
        
        let newItem = Item()
        newItem.title = "To Do 1"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "To Do 2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "To Do 3"
        itemArray.append(newItem3)
        
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New To Do List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text!)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

