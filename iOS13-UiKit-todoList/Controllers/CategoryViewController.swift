//
//  CategoryViewController.swift
//  iOS13-UiKit-todoList
//
//  Created by TheGIZzz on 17/5/2565 BE.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categories = [Category]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()

    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = item.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }

    // MARK: - UITableViewDataSource

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add", style: .default) { (action) in

            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)

            self.tableView.reloadData()

            self.saveItems()
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
            print(alertTextField.text!)
        }

        alert.addAction(action)

        self.present(alert, animated: true, completion: nil)
    }

    private func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error coding item array \(error)")
        }

        tableView.reloadData()
    }

    private func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {

        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }

        tableView.reloadData()
    }
}

