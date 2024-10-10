import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cartTableView: UITableView!

    var cartItems: [String] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        cell.textLabel?.text = cartItems[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the cart items from CartManager
        cartItems = cartManager.shared.cartItems
        
        // Set table view delegate and data source
        cartTableView.delegate = self
        cartTableView.dataSource = self

        // Reload the table view
        cartTableView.reloadData()
    }
}
