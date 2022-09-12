
import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Apple", "Yellow", "Destroy man"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
//
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // what will happen once the user clicks in UI alert
            print("Success")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

