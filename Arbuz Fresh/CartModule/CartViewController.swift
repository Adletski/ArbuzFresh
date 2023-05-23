//
//  CartViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 22.05.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK: - Properties
    
    var cartViewModel = CartViewModel()
    var total = 0.0
    var productCount = 0
    
    //MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartOrderTableViewCell.self, forCellReuseIdentifier: CartOrderTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ и оплатить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.addTarget(nil, action: #selector(payButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name of product"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    //MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        title = "Orders"
        view.backgroundColor = .white
        navigationItem.backButtonTitle = ""
        view.addSubview(tableView)
        view.addSubview(payButton)
        view.addSubview(nameLabel)
        view.addSubview(quantityLabel)
        view.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(view.snp.leading).offset(5)
        }
        
        quantityLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.trailing.equalTo(view.snp.trailing).offset(-60)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom).offset(-100)
        }
        
        payButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(50)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func payButtonPressed() {
        navigationController?.pushViewController(FinishViewController(), animated: true)
    }
}

//MARK: - Extension

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cartViewModel.placeOrderProductArray?.count ?? 1) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartOrderTableViewCell.identifier, for: indexPath) as? CartOrderTableViewCell else { return UITableViewCell() }
        if indexPath.row == (cartViewModel.placeOrderProductArray?.count ?? 0) {
            cell.nameProductLabel.text = "Total: "
            cell.priceProductLabel.text = "\(total.round(2))$"
            cell.quantityProductLabel.text = "\(productCount)"
            cell.backgroundColor = .systemGray5
        } else {
            guard let grocery = cartViewModel.placeOrderProductArray?[indexPath.row] else { return UITableViewCell() }
            total += (Double(grocery.price) ?? 0.0) * Double(grocery.productCount)
            productCount += grocery.productCount
            cell.nameProductLabel.text = grocery.name
            cell.quantityProductLabel.text = "\(grocery.productCount)"
            let price = Double(grocery.price) ?? 0.0
            cell.priceProductLabel.text = "\((price * Double(grocery.productCount)).round(2))$"
        }
        return cell
    }
}
