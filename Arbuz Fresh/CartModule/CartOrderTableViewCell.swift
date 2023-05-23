//
//  CartOrderTableViewCell.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import UIKit

class CartOrderTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "CartOrderTableViewCell"
    
    //MARK: - UI Elements
    
    lazy var nameProductLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var quantityProductLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var priceProductLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    //MARK: - Initialize

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        contentView.addSubview(nameProductLabel)
        contentView.addSubview(quantityProductLabel)
        contentView.addSubview(priceProductLabel)
    }
    
    private func setupConstraints() {
        
        quantityProductLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.leading.equalTo(contentView.snp.trailing).offset(-80)
        }
        
        nameProductLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.trailing.equalTo(quantityProductLabel.snp.leading).offset(-5)
        }
        
        priceProductLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
    }

}
