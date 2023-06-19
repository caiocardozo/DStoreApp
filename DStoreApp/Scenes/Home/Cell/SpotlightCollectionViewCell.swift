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
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setupExtraConfigurations()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup
    func addViews() {
        contentView.addSubview(bannerImageView)
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowRadius = 8.0
        contentView.clipsToBounds = true
    }
    func addConstraints() {
        bannerImageView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(8)
        }
    }
    func setupExtraConfigurations() {
        backgroundColor = .clear
    }
    func setup(spotlight: Spotlight) {
        if let img = spotlight.bannerURL {
            bannerImageView.setImage(imageURL: img)
        }
    }
}
