import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let list = ["Blouse", "Shirt", "Pullover", "Street clothes"]
    
    // IBOutlet for your table view
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func cartClicked(_ sender: Any) {
        performSegue(withIdentifier: "cartSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath)
        let contentView = cell.contentView
        let label = contentView.viewWithTag(1) as! UILabel
        let image = contentView.viewWithTag(2) as! UIImageView
        label.text = list[indexPath.row]
        image.image = UIImage(named: list[indexPath.row])
        return cell
    }
    
    // This method is called when a cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender:list[indexPath.row] )
    }
    
    // Prepare for segue and pass data to ViewControllerDetails
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = sender as! String
        let detailsVC = segue.destination as! ViewControllerDetails
        detailsVC.name = data
        detailsVC.image = data
    }
}
