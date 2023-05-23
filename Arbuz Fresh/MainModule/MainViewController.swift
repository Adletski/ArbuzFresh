//
//  MainViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var mainViewModel = MainViewModel()
    
    private lazy var money: Double = 50
    private lazy var numberOfItemsCount = 0
    
    //MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 5
        return tableView
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Balance: 50$"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Number of items: 0"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    //MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.initialize()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(cartButtonPressed))
        title = "Shopping basket"
        view.backgroundColor = .green
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(balanceLabel)
        view.addSubview(numberOfItemsLabel)
    }
    
    private func setupConstraints() {
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.snp.leading).offset(50)
        }
        
        numberOfItemsLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.snp.trailing).offset(-50)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func cartButtonPressed() {
        let cartVC = CartViewController()
        cartVC.cartViewModel.placeOrderProductArray = mainViewModel.tempGroceries
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
}

//MARK: - Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.groceries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let grocery = mainViewModel.groceries?[indexPath.row]
        var tempGrocery = mainViewModel.tempGroceries
        guard let grocery = grocery else { return UITableViewCell() }
        cell.groceryImageView.image = UIImage(named: grocery.image)
        cell.nameLabel.text = grocery.name
        cell.weightLabel.text = "Weight: \(grocery.weight)"
        cell.idLabel.text = "Id: \(grocery.id)"
        cell.countryLabel.text = "Country: \(grocery.country)"
        cell.priceLabel.text = "Price: \(grocery.price)$"
        cell.addToCartButton.isHidden = grocery.isProductAddedToCart
        cell.callBackForAddToCart = {
            grocery.isProductAddedToCart = true
            cell.addToCartButton.isHidden = true
            self.mainViewModel.tempGroceries.append(grocery)
        }
        cell.productCountLabel.text = "\(grocery.productCount)"
        cell.callBackForAddProductToCart = {
            if (self.money - (Double(grocery.price) ?? 0.0)) > 0 {
                grocery.productCount += 1
                self.money -= Double(grocery.price) ?? 0.0
                self.numberOfItemsCount += 1
                self.balanceLabel.text = "Balance: \(self.money.round(2))$"
                self.numberOfItemsLabel.text = "Number of items: \(self.numberOfItemsCount)"
            } else {
                let alertController = UIAlertController(title: "Sorry!", message: "Not enough money to buy!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true)
            }
            cell.productCountLabel.text = "\(grocery.productCount)"
        }
        cell.callBackForRemoveProductFromCart = {
            if self.numberOfItemsCount >= 0 {
                if grocery.productCount == 0 {
                    cell.addToCartButton.isHidden = false
                    cell.productCountLabel.text = "\(grocery.productCount)"
                } else {
                    if self.money > 0 {
                        grocery.productCount -= 1
                        self.money += Double(grocery.price) ?? 0.0
                        self.numberOfItemsCount -= 1
                        self.balanceLabel.text = "Balance: \(self.money.round(2))$"
                        self.numberOfItemsLabel.text = "Number of items: \(self.numberOfItemsCount)"
                    }
                    cell.productCountLabel.text = "\(grocery.productCount)"
                }
            } else {
                if self.money > 0 {
                    grocery.productCount = 0
                    self.money += Double(grocery.price) ?? 0.0
                    self.balanceLabel.text = "Balance: 50$"
                    self.numberOfItemsCount = 0
                    tempGrocery.remove(at: indexPath.row)
                    self.numberOfItemsLabel.text = "Number of items: \(self.numberOfItemsCount)"
                }
                cell.addToCartButton.isHidden = false
                cell.productCountLabel.text = "\(grocery.productCount)"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
