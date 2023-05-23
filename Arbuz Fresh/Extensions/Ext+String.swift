//
//  Ext+String.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import Foundation

extension String {

    var isValidUserName: Bool {
       let RegEx = "^\\w{7,18}$"
//       let RegEx = "^[a-zA-Z0-9_]{7,18}$"
       let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
       return Test.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
       let RegEx = "^\\w{7,18}$"
       let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
       return Test.evaluate(with: self)
    }
}
