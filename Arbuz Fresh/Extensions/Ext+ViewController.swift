//
//  Ext+ViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 20.05.2023.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func createLabel(text: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = color
        return label
    }
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }
}
