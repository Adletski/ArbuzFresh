//
//  FinishView.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import UIKit

class FinishView: UIView {
    
    //MARK: - Properties
    
    var payButtonPressed: ((UIAlertController) -> Void)?
    var callBackNavigate: ((Bool) -> Void)?
    
    //MARK: - UI Elements

    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста заполните свои данные для доставки 😁"
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите свое имя: "
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите свой адрес: "
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите свой номер телефона: "
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Напишите свое имя"
        usernameTextField.backgroundColor = .systemGray5
        usernameTextField.textColor = .black
        usernameTextField.setLeftIcon(image: UIImage(systemName: "person.fill") ?? UIImage.remove)
        usernameTextField.layer.cornerRadius = 15
        return usernameTextField
    }()
    
    private lazy var addressTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Напишите свое адрес"
        usernameTextField.backgroundColor = .systemGray5
        usernameTextField.textColor = .black
        usernameTextField.setLeftIcon(image: UIImage(systemName: "location") ?? UIImage.remove)
        usernameTextField.layer.cornerRadius = 15
        return usernameTextField
    }()
    
    private lazy var phoneTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Напишите свое телефон"
        usernameTextField.backgroundColor = .systemGray5
        usernameTextField.textColor = .black
        usernameTextField.setLeftIcon(image: UIImage(systemName: "phone") ?? UIImage.remove)
        usernameTextField.layer.cornerRadius = 15
        return usernameTextField
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.addTarget(nil, action: #selector(finishPayButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initialize
    
    convenience init() {
        self.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(informationLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(addressLabel)
        addSubview(addressTextField)
        addSubview(phoneLabel)
        addSubview(phoneTextField)
        addSubview(payButton)
    }
    
    private func setupConstraints() {
        informationLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(100)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
            $0.height.equalTo(40)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        addressTextField.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
            $0.height.equalTo(40)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(addressTextField.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
            $0.height.equalTo(40)
        }
        
        payButton.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(50)
            $0.leading.equalTo(snp.leading).offset(50)
            $0.trailing.equalTo(snp.trailing).offset(-50)
            $0.height.equalTo(50)
        }
    }
    
    //MARK: - Methods
    
    @objc func finishPayButtonPressed() {
        
        if nameTextField.text == "" || addressTextField.text == "" || phoneTextField.text == "" {
            
            let alertController = UIAlertController(title: "Ошибка", message: "Заполните все поля!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            payButtonPressed?(alertController)
            
        } else {
            
            let alertController = UIAlertController(title: "Успех", message: "Ваш заказ успешно принят, ожидайте доставки!", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let defaultAction = UIAlertAction(title: "OK", style: .default) { action in
                self.callBackNavigate?(true)
            }
            alertController.addAction(defaultAction)
            payButtonPressed?(alertController)
        }
    }
}
