//
//  ViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 20.05.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: - View
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginPressed = { [weak self] alert, check in
            if check {
                self?.navigationController?.pushViewController(OnboardingViewController(), animated: true)
            } else {
                self?.present(alert, animated: true)
            }
        }
        view.signUpPressed = { [weak self] in
            self?.navigationController?.pushViewController(SignUpViewController(), animated: true)
        }
        return view
    }()
    
    //MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(loginView)
    }

    private func setupConstraints() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

