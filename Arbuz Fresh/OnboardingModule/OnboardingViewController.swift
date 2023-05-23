//
//  OnboardingViewController.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    
    var onboardingViewModel = OnboardingViewModel()
    
    var currentPage = 0 {
        didSet {
            if currentPage == onboardingViewModel.slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("NEXT", for: .normal)
            }
        }
    }
    
    //MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(nil, action: #selector(nextButtonPressed), for: .touchUpInside)
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
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.bottom.equalTo(view.snp.bottom).offset(-200)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(pageControl.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
    }
    
    //MARK: - Methods
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 1)
            layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
            layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            return layoutSection
        }
    }
    
    @objc
    func nextButtonPressed() {
        if currentPage == onboardingViewModel.slides.count - 1 {
            navigationController?.pushViewController(MainViewController(), animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = currentPage
        }
    }
}

//MARK: - Extension

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingViewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.setup(onboardingViewModel.slides[indexPath.row])
        return cell
    }
}
