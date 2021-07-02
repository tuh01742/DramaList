//
//  LogInViewController.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/28/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    //UI properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
        
       
    }
    

    //sets up the UI elements
    func setUpProperties(){
        errorLabel.alpha = 0
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.backgroundColor = UIColor(hexString: "FFFFFF").cgColor
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "9E9E9E")])
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }
    
    func validateFields() -> String?{
        
        //check that all fields are filled in
        
        if
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        //check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanedPassword) == false{
            return "Please make sure your password and email is correct"
        }
        
        
        
        return nil
    }
    
   
    @IBAction func logInButtonTapped(_ sender: Any) {
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            //there's something wrong with the fields, show error message
            showError(error!)
        }
        else{
            //create cleaned versions of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create the user
           Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        
            if error != nil{
                self.errorLabel.text = error!.localizedDescription
                //self.showError(error!.localizedDescription)
                self.errorLabel.alpha = 1
                
            }else{
                //self.transitionToHome()
                self.transitionToHome()
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
    
}
