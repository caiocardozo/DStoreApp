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
    lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá Maria"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 44
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()
    lazy var cashComponent: CashTitleBanner = {
        var cash = CashTitleBanner()
        return cash
    }()
    lazy var spotlightCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SpotlightCollectionViewCell.self, forCellWithReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var titleProductLabel: UILabel = {
        let label = UILabel()
        label.text = "Produtos"
        label.textColor = UIColor.appColor(.primaryColorBlue)
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    lazy var productsCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        return collection
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameUserLabel)
        contentView.addSubview(spotlightCollectionView)
        contentView.addSubview(cashComponent)
        contentView.addSubview(titleProductLabel)
        contentView.addSubview(productsCollectionView)
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
            make.leading.top.equalTo(safeAreaLayoutGuide).inset(16)
        }
        nameUserLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.top.equalToSuperview()
        }
        spotlightCollectionView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(-44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
        cashComponent.snp.makeConstraints { make in
            make.top.equalTo(spotlightCollectionView.snp.bottom).inset(-44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(134)
        }
        titleProductLabel.snp.makeConstraints { make in
            make.top.equalTo(cashComponent.snp.bottom).inset(-44)
            make.leading.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleProductLabel.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(150)
        }
    }
    
    func setupCash(cash: Cash) {
        cashComponent.setup(cash: cash)
    }
}

