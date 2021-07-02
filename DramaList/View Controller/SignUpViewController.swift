//
//  SignUpViewController.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/28/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var createAcctButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
        
    }
    
    func setUpProperties(){
        errorLabel.alpha = 0
    }
    func validateFields() -> String?{
        
        //check that all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        
        //check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanedPassword) == false{
            return "Password must be at least 8 characters or longer.      At least contains one number or symbol."
        }
        
        return nil
    }
    

    @IBAction func createAccountTapped(_ sender: Any) {
      //validate the fields
        let error = validateFields()
        
        if error != nil{
            //there's something wrong with the fields, show error message
            showError(error!)
        }
        
        
        else{
            //create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                //check for errors
                if error != nil{
                    //there was an error creating the user
                    self.showError("Error creating user")
                }else{
                   let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstName ,
                                                              "lastname": lastName ,"uid": result!.user.uid ]){ (error) in
                    if error != nil{
                        self.showError("Error saving user data")
                    }
                                                                
                    }
                   
                    //transition to home screen
                    self.transitionToLogInScreen()
                    
                }
                
                
            }
        }
        
    }
    
    
    
   func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    func transitionToHome(){
       let homeViewController =  storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as?    HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func transitionToLogInScreen(){
        let logInViewController =  storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.logInViewController) as?    LogInViewController
        view.window?.rootViewController = logInViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
