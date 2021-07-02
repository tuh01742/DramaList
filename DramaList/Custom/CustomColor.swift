//
//  CustomColor.swift
//  DramaList
//
//  Created by Rabia Tanveer on 4/24/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import Foundation
import Chameleon

struct CustomColor{
    
    let magenta: UIColor!
    
    init(withFrame: CGRect){
        
    let firstColor = UIColor(hexString: "F97794", withAlpha: 1)
    let secondColor = UIColor(hexString: "623AA2", withAlpha: 1)
        
        magenta = UIColor(gradientStyle: .leftToRight, withFrame: withFrame, andColors: [firstColor!, secondColor!])
        
    }
    
    //Gets the magenta color
    func getMagentaColor() -> UIColor{
        return magenta
    }
}
