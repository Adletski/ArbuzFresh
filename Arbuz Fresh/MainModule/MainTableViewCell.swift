//
//  MainTableViewCell.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 22.05.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "MainTableViewCell"
    
    var callBackForAddToCart: (() -> Void)?
    var callBackForAddProductToCart: (() -> Void)?
    var callBackForRemoveProductFromCart: (() -> Void)?
    
    //MARK: - UI Elements
    
    lazy var container: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.976, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(nil, action: #selector(plusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(nil, action: #selector(minusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var productCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(addToCartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var groceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "fbb169")
        imageView.layer.cornerRadius = 15
        return imageView
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
        selectionStyle = .none
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(productCountLabel)
        stackView.addArrangedSubview(plusButton)
        contentView.addSubview(container)
        let arr = [nameLabel,weightLabel,idLabel,priceLabel,countryLabel,groceryImageView,stackView,addToCartButton]
        arr.forEach {
            container.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        container.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(3)
            $0.leading.equalTo(contentView.snp.leading).offset(6)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-6)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-3)
        }
        
        groceryImageView.snp.makeConstraints {
            $0.top.equalTo(container.snp.top).offset(3)
            $0.leading.equalTo(container.snp.leading).offset(3)
            $0.bottom.equalTo(container.snp.bottom).offset(-3)
            $0.width.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(7)
            $0.leading.equalTo(groceryImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-5)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(groceryImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-5)
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(7)
            $0.leading.equalTo(groceryImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-5)
        }
        
        countryLabel.snp.makeConstraints {
            $0.top.equalTo(weightLabel.snp.bottom).offset(7)
            $0.leading.equalTo(groceryImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-5)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(countryLabel.snp.bottom).offset(7)
            $0.leading.equalTo(groceryImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(addToCartButton.snp.leading).offset(-5)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(container.snp.centerY)
            $0.trailing.equalTo(container.snp.trailing)
        }
        
        addToCartButton.snp.makeConstraints {
            $0.centerY.equalTo(container.snp.centerY)
            $0.trailing.equalTo(container.snp.trailing).offset(-5)
            $0.width.equalTo(70)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func minusButtonPressed() {
        self.callBackForRemoveProductFromCart?()
    }
    
    @objc
    func plusButtonPressed() {
        self.callBackForAddProductToCart?()
    }
    
    @objc
    func addToCartButtonPressed() {
        self.callBackForAddToCart?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        addToCartButton.isHidden = false
    }
}
