//
//  ProductsCollectionViewCell.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.3
        return view
    }()
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setupExtraConfigurations()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup
    func addViews() {
        cardView.addSubview(bannerImageView)
        contentView.addSubview(cardView)
    }
    func addConstraints() {
        cardView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(24)
        }
        bannerImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(60)
        }
    }
    func setupExtraConfigurations() {
        clipsToBounds = true
        backgroundColor = .clear
    }
    func setup(product: Product) {
        if let img = product.imageURL {
            bannerImageView.setImage(imageURL: img)
        }
    }
}
