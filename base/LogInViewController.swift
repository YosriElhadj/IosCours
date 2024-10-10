//
//  LogInViewController.swift
//  base
//
//  Created by Yosri Elhadj on 9/10/2024.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {
    
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBAction func logInPressed(_ sender: Any) {
        checkUserCredentials()
    }
    
    func checkUserCredentials(){
        guard let email=EmailTxtField.text, !email.isEmpty,
              let password=passTxtField.text, !password.isEmpty else{
            showAlert(title: "Error", message: "Please enter both email and password")
            return
        }
        
        if validateCredential(email: email, password: password)
        {
            print("login successful")
            performSegue(withIdentifier: "logSegue", sender: self)
        }else
        {
            print("invalid email or password")
            showAlert(title: "Login Failed", message: "Invalid email or password")
        }
    }
    
    func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    
    func validateCredential(email:String,password:String)->Bool{
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        let managedContext=appDelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Users")
        fetchRequest.predicate=NSPredicate(format: "email == %@ AND password == %@",email,password)
        do{
            let results=try managedContext.fetch(fetchRequest)
            if results.count>0{
                return true
            }
        }catch{
            print("Failed to fetch users: \(error)")
        }
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
