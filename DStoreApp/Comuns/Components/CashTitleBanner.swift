//
//  CashTitleBanner.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 15/06/23.
//

import UIKit
import SnapKit

final class CashTitleBanner: BaseView {
    
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.layer.shadowRadius = 8.0
        image.clipsToBounds = true
        return image
    }()
    
    override func addViews() {
        self.addSubview(titleLabel)
        self.addSubview(bannerImageView)
    }
    
    override func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.height.equalTo(62)
        }
    }
    
    func setup(cash: Cash) {
        titleLabel.attributedText = .combine("digio ".primaryTitleBlue, "Cash".primaryTitleGray)
        if let img = cash.bannerURL{
            bannerImageView.setImage(imageURL: img)
        }
    }
}
