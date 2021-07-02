//
//  CustomTextField.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/28/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSetup()
        
    }
    //sets up the textfield to custom
    func defaultSetup(){
    layer.borderWidth = 1
    layer.backgroundColor = UIColor(hexString: "FFFFFF").cgColor
    attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "9E9E9E")])
       layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }
    
    

}
