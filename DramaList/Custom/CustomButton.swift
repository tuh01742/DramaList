//
//  CustomButton.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/28/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    
    //First Loading func
    override init(frame: CGRect) {
        super.init(frame: frame)
        //defaultSetup()
       // makeCustomWhiteButton()
    }
    
    
    //First requires loading func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSetup()
        //makeCustomWhiteButton()
    }
    
    //Customize the button to magenta bg color
    func defaultSetup(){
        //Log In Button
        let magenta = CustomColor(withFrame: frame).getMagentaColor()
        layer.backgroundColor = magenta.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
        
        //Spacing for log in Button
        let spacing = 1.5
        let buttonAttributedString = NSMutableAttributedString(string: (titleLabel?.text)!)
        buttonAttributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, buttonAttributedString.length))
        self.setAttributedTitle(buttonAttributedString, for: .normal)
        
    }
    //sign up button with white bg color
    func makeCustomWhiteButton(){
        let magenta = CustomColor(withFrame: frame).getMagentaColor()
        //Sign Up Button
        layer.borderWidth = 2
        backgroundColor = .white
        layer.borderColor = magenta.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
        
        //Spacing for sign up button
        let signUpSpacing = 1.5
        let signUpButtonAttributedString = NSMutableAttributedString(string: (titleLabel?.text)!)
        signUpButtonAttributedString.addAttribute(NSAttributedString.Key.kern, value: signUpSpacing, range: NSMakeRange(0, signUpButtonAttributedString.length))
        self.setAttributedTitle(signUpButtonAttributedString, for: .normal)
    }
    
    
    
}
