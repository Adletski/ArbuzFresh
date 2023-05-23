//
//  SignUpView.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import Foundation
import UIKit

class SignUpView: UIView {
    
    //MARK: - Properties
    
    var registerPressed: ((UIAlertController, Bool) -> Void)?
    
    //MARK: - UI Elements
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
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
    
    lazy var subscribeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type of subscribe"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    lazy var subscribeSegmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Standard","Premium"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private lazy var loginTextField: UITextField = {
       let usernameTextField = UITextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.setLeftIcon(image: UIImage(systemName: "person.fill") ?? UIImage.remove)
        usernameTextField.backgroundColor = .white
        usernameTextField.textColor = .black
        return usernameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
       let passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter password"
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock.fill")!)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        return passwordTextField
    }()
    
    private lazy var reEnterPasswordTextField: UITextField = {
       let passwordTextField = UITextField()
        passwordTextField.placeholder = "Re-enter password"
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock.fill")!)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        return passwordTextField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.9794567227, green: 0.7637260556, blue: 0.1773841083, alpha: 1)
        button.addTarget(nil, action: #selector(registerButtonPressed), for: .touchUpInside)
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
        addSubview(signUpLabel)
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(reEnterPasswordTextField)
        addSubview(subscribeLabel)
        addSubview(subscribeSegmentControl)
        addSubview(registerButton)
    }
    
    private func setupConstraints() {
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(100)
            $0.leading.equalTo(snp.leading).offset(30)
        }
    
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).offset(30)
            $0.leading.equalTo(snp.leading).offset(30)
        }

        loginTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }

        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(20)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        reEnterPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        subscribeLabel.snp.makeConstraints {
            $0.top.equalTo(reEnterPasswordTextField.snp.bottom).offset(25)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }
        
        subscribeSegmentControl.snp.makeConstraints {
            $0.top.equalTo(subscribeLabel.snp.bottom).offset(25)
            $0.leading.equalTo(snp.leading).offset(30)
            $0.trailing.equalTo(snp.trailing).offset(-30)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(subscribeSegmentControl.snp.bottom).offset(35)
            $0.leading.equalTo(snp.leading).offset(20)
            $0.trailing.equalTo(snp.trailing).offset(-20)
            $0.height.equalTo(70)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func registerButtonPressed() {
        validationOfTextFields()
    }
    
    func validationOfTextFields() {
        
        if (passwordTextField.text == "" || reEnterPasswordTextField.text == "" || loginTextField.text == "") {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter all text fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            registerPressed?(alertController, false)
            
        } else if loginTextField.text?.isValidUserName == false {
            
            let alertController = UIAlertController(title: "Error", message: "Check username validation! Username allows only small a to z, capital A to Z, 0 to 9 number with underscore, length between 7 to 18. Thank you!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            registerPressed?(alertController, false)
            
        } else if passwordTextField.text?.isValidPassword == false {
            
            let alertController = UIAlertController(title: "Error", message: "Check password validation! Username allows only small a to z, capital A to Z, 0 to 9 number with underscore, length between 7 to 18. Thank you!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            registerPressed?(alertController, false)
            
        } else if passwordTextField.text != reEnterPasswordTextField.text {
            
            let alertController = UIAlertController(title: "Error", message: "Passwords don't match", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            registerPressed?(alertController, false)
            
        } else {
            for user in dict {
                if user.value["name"] == loginTextField.text {
                    let alertController = UIAlertController(title: "Error", message: "Username already exists, please choose another one", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    registerPressed?(alertController, false)
                    return
                }
            }
        }
        dict[dict.count+1] = ["name": "\(loginTextField.text ?? "")", "password": "\(passwordTextField.text ?? "")"]
        let alertController = UIAlertController(title: "Success", message: "Thank you for registration", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        registerPressed?(alertController, true)
    }
}

