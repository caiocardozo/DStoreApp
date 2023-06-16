//
//  HomeView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        
        return scroll
    }()
    let contentView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icUser")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá Maria"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 44
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()
    let cashComponent: CashTitleBanner = {
        return CashTitleBanner()
    }()
    lazy var spotlightCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SpotlightCollectionViewCell.self, forCellWithReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier)
        collection.showsHorizontalScrollIndicator = false
       
        return collection
    }()
    
    lazy var productsCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        collection.showsHorizontalScrollIndicator = false
       
        return collection
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        mainStackView.addArrangedSubview(spotlightCollectionView)
        mainStackView.addArrangedSubview(cashComponent)
        mainStackView.addArrangedSubview(productsCollectionView)
        contentView.addSubview(mainStackView)
        scrollView.addSubview(contentView)
    }
    
    override func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
            make.height.equalToSuperview().priority(.low)
        }
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.leading.top.equalTo(16)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.top.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(-36)
            make.leading.trailing.equalToSuperview()
            make.bottom.greaterThanOrEqualToSuperview()
        }
        productsCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(spotlightCollectionView.snp.bottom).inset(-56)
//            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        spotlightCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(spotlightCollectionView.snp.bottom).inset(-56)
//            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    func setupCash(cash: Cash) {
        cashComponent.setup(cash: cash)
    }
}

