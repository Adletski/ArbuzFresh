//
//  SignUpViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import UIKit

var dict = [1: ["name": "Adlet", "password": "123456789"]]

class SignUpViewController: UIViewController {
    
    //MARK: - View
    
    private lazy var signUpView: SignUpView = {
        let view = SignUpView()
        view.registerPressed = { [weak self] alertController, check in
            if check {
                self?.navigationController?.popToRootViewController(animated: true)
            } else {
                self?.present(alertController, animated: true)
            }
        }
        return view
    }()
    
    //MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(signUpView)
    }
    
    private func setupConstraints() {
        signUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


