//
//  SignupViewController.swift
//  base
//
//  Created by Yosri Elhadj on 10/10/2024.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    @IBAction func signupClicked(_ sender: Any) {
        
        addUser()
        
    }
    
    func addUser(){
        guard let email=emailTextField.text,!email.isEmpty,
              let password=passwordTextField.text,!password.isEmpty else{
            showAlert(title: "Error", message: "please enter both email and password")
            return
        }
        
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext=appDelegate.persistentContainer.viewContext
        
        let entity=NSEntityDescription.entity(forEntityName: "Users", in: managedContext)!
        let newUser=NSManagedObject(entity: entity, insertInto: managedContext)
        
        newUser.setValue(email, forKey: "email")
        newUser.setValue(password, forKey: "password")
        
        do{
            try managedContext.save()
            print("GOOD")
            showAlert(title: "Success", message: "User registered successfully!")
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
            showAlert(title: "Error", message: "Failed to save user")
        }
    }
    

    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
