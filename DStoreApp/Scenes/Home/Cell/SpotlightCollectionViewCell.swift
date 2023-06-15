//
//  SpotlightCollectionViewCell.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import UIKit
import SnapKit

class SpotlightCollectionViewCell: UICollectionViewCell {
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.shadowRadius = 8.0
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
        contentView.addSubview(bannerImageView)
    }
    func addConstraints() {
        bannerImageView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(-8)
        }
    }
    func setupExtraConfigurations() {
        clipsToBounds = true
        backgroundColor = .clear
    }
}

extension SpotlightCollectionViewCell {
    func setup(spotlight: Spotlight) {
        if let img = spotlight.bannerURL {
            bannerImageView.loadFrom(URLAddress: img)
        }
    }
}
