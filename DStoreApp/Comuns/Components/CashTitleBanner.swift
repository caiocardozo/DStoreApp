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
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.shadowRadius = 8.0
        return image
    }()
    
    override func addViews() {
        self.addSubview(titleLabel)
        self.addSubview(bannerImageView)
    }
    
    override func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(62)
        }
    }
    
    func setup(cash: Cash) {
        titleLabel.text = cash.title
        if let img = cash.bannerURL{
            bannerImageView.loadFrom(URLAddress: img)
        }
    }
}
