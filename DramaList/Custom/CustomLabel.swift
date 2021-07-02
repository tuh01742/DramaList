//
//  CustomLabel.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/28/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    
    //First load func
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    //First required to load
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // defaultSetup()
    }
    
    //Sets up the dault spacing to 1
    func defaultSetup(){ 
        let labelSpace = 1
        let labelAttributedString = NSMutableAttributedString(string: text!)
        labelAttributedString.addAttribute(NSAttributedString.Key.kern, value: labelSpace, range: NSMakeRange(0, labelAttributedString.length))
        attributedText = labelAttributedString
    }
    //Sets the spacing of text
    func setSpacing(space: CGFloat){
        let labelAttributedString = NSMutableAttributedString(string: text!)
        labelAttributedString.addAttribute(NSAttributedString.Key.kern, value: space, range: NSMakeRange(0, labelAttributedString.length))
        attributedText = labelAttributedString
    }
    
}
