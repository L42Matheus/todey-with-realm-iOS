
import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Find Lucas"
        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Palloma"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Matheus"
        itemArray.append(newItem3)
        
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemArray[indexPath.row].title

//        cell.accessoryType = item.done == true ? .checkmark : .none
        
        if item.done == true {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    //Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks in UI alert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField

        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

