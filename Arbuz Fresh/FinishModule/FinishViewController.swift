//
//  FinishViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import UIKit

class FinishViewController: UIViewController {
    
    //MARK: - View
    
    lazy var finishView: FinishView = {
        let finishView = FinishView()
        finishView.payButtonPressed = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        finishView.callBackNavigate = { [weak self] check in
            if check {
//                self?.navigationController?.popToRootViewController(animated: true)
                self?.navigationController?.pushViewController(ReceiptViewController(), animated: true)
            }
        }
        return finishView
    }()
    
    //MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .white
        view.addSubview(finishView)
    }
    
    private func setupConstraints() {
        finishView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
