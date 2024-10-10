import UIKit
import CoreData

class ViewControllerDetails: UIViewController{
    var name : String?
    var image : String?


    // Outlets for the image view and label in the details view controller
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
   


    
    let alert=UIAlertController(title:"Product", message: "Added succesfuly", preferredStyle: .alert)
    let action=UIAlertAction(title: "ok", style: .cancel)
    
    
    
    
    @IBAction func addProductTapped(_ sender: UIButton) {
        save()
        if let productName = detailsLabel.text {
                cartManager.shared.cartItems.append(productName)
            }
        alert.addAction(action)
        self.present(alert,animated: true)
        
    }
    



    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the image and label with the passed data
        detailsImageView.image = UIImage(named: image!)
        detailsLabel.text = name!
        
    }
    
    func save(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        let persistantContainer = appDelegate.persistentContainer
        
        
        let managedContext = persistantContainer.viewContext
        
        let entityDescreption = NSEntityDescription.entity(forEntityName: "Products", in: managedContext)
        
        let object  = NSManagedObject(entity: entityDescreption!, insertInto: managedContext)
        
        
        object.setValue(detailsLabel.text, forKey: "name")
        
        do {
            
            try managedContext.save()
            
            
            print("INSERT good")
            
        } catch  {
            
            print("INSERT failed")
            
            
        }
    }
    
    
    
  
//    func show(){
//    
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let persistantContainer = appDelegate.persistentContainer
//        let managedContext = persistantContainer.viewContext
//        
//        let request = NSFetchRequest<NSManagedObject>(entityName: "Products")// select * from Movie
//        
//        do {
//            let resultReq =  try  managedContext.fetch(request)
//            for item in resultReq {
//                fav.append(item.value(forKey: "name") as! String)
//                
//            }
//        } catch  {
//            print("fetch error")
//        }
//    }
}
