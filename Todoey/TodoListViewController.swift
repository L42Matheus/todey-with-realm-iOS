
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

}

