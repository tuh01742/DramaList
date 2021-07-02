//
//  LogInSignUpViewController.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/24/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit

class LogInSignUpViewController: UIViewController {
    //UI View Properties
    @IBOutlet weak var logInButton: CustomButton!
    @IBOutlet weak var signUpButton: CustomButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    
    @IBOutlet weak var DramaListLabel: CustomLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
    
        
    }
    //sets up UI elements
    func setUpProperties(){
       
        
        signUpButton.makeCustomWhiteButton()
        DramaListLabel.setSpacing(space: 1.75)
        
    }
    
    //Hides the status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    
    
    
    
    
    
    

    

}
