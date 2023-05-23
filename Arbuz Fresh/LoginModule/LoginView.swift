//
//  LoginView.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 20.05.2023.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    //MARK: - Properties
    
    var loginPressed: ((UIAlertController, Bool) -> Void)?
    var signUpPressed: (() -> Void)?
    
    //MARK: - UI Elements
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arbuzfresh")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "ARBUZ FRESH"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Food Delivery App"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
       let usernameTextField = UITextField()
        usernameTextField.placeholder = "keanureeves01"
        usernameTextField.text = "Adlet"
        usernameTextField.setLeftIcon(image: UIImage(systemName: "person.fill") ?? UIImage.remove)
        usernameTextField.backgroundColor = .white
        usernameTextField.textColor = .black
        return usernameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
       let passwordTextField = UITextField()
        passwordTextField.placeholder = "123456789"
        passwordTextField.text = "123456789"
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock.fill")!)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.addTarget(nil, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't Have Account?"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.addTarget(nil, action: #selector(signUpButtonPressed), for: .touchUpInside)
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
        addSubview(logoLabel)
        addSubview(logoImage)
        addSubview(descriptionLabel)
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(dontHaveAccountLabel)
        addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        
        logoImage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalTo(snp.centerX)
            $0.height.equalTo(150)
            $0.width.equalTo(200)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom)
            $0.centerX.equalTo(snp.centerX)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(snp.centerX)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(15)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(15)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(15)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalTo(snp.leading).offset(20)
            $0.trailing.equalTo(snp.trailing).offset(-20)
            $0.height.equalTo(70)
        }
        
        dontHaveAccountLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(50)
            $0.leading.equalTo(snp.leading).offset(30)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(50)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func loginButtonPressed() {
        for user in dict {
            if user.value["name"] == loginTextField.text && user.value["password"] == passwordTextField.text {
                let alertController = UIAlertController(title: "Success", message: "Congratulations!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                loginPressed?(UIAlertController(),true)
                return
            }
        }
        let alertController = UIAlertController(title: "Error", message: "Username don't exist, please sign up!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        loginPressed?(alertController, false)
    }
    
    @objc
    func signUpButtonPressed() {
        signUpPressed?()
    }
}
