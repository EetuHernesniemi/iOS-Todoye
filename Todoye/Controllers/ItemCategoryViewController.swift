//
//  CategoryViewController.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 4.4.2022.
//

import UIKit
import RealmSwift

class ItemCategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categories: Results<ItemCategory>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        let destinationVC = seque.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(itemCategory: ItemCategory) {
        do {
            try realm.write{
                realm.add(itemCategory)
            }
        } catch {
            print("Error saving category")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(ItemCategory.self)
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) {(action) in
            let newCategory = ItemCategory()
            newCategory.name = textField.text!
            
            self.save(itemCategory: newCategory)
        }
        alert.addAction(action)
        alert.addTextField(){(field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
