//
//  ReceiptViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var confirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "Спасибо! Ваш платеж принят! Ожидайте доставку в назначенное время!"
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var goBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вернуться в главное меню", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.addTarget(nil, action: #selector(goBackButtonPressed), for: .touchUpInside)
        return button
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
        view.addSubview(confirmationLabel)
        view.addSubview(goBackButton)
    }
    
    private func setupConstraints() {
        confirmationLabel.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        goBackButton.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.bottom.equalTo(view.snp.bottom).offset(-100)
        }
    }
    
    //MARK: - Methods
    
    @objc
    func goBackButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }

}
