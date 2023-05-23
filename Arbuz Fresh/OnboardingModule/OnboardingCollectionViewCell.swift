//
//  OnboardingCollectionViewCell.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "OnboardingCollectionViewCell"
    
    //MARK: - UI Elements
    
    lazy var slideImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var slideTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var slideDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
    private func setupViews() {
        contentView.addSubview(slideImageView)
        contentView.addSubview(slideTitleLabel)
        contentView.addSubview(slideDescriptionLabel)
    }
    
    private func setupConstraints() {
        
        slideImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-10)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-200)
        }
        
        slideTitleLabel.snp.makeConstraints {
            $0.top.equalTo(slideImageView.snp.bottom).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
        
        slideDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(slideTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
