//
//  Ext+Double.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import Foundation

extension Double {
    
    func round(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
