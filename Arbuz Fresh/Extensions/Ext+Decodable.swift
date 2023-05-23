//
//  Ext+Decodable.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 22.05.2023.
//

import Foundation

extension Decodable {
  static func parse(jsonFile: String) -> Self? {
    guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let output = try? JSONDecoder().decode(self, from: data)
        else {
      return nil
    }
    return output
  }
}
