//
//  CashTitleBanner.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 15/06/23.
//

import UIKit
import SnapKit

protocol CashTitleBannerDelegate: AnyObject {
    func didTapBanner(cash: Cash)
}

class CashTitleBanner: BaseView {
    // MARK: - Variables
    weak var delegate: CashTitleBannerDelegate?
    var cash: Cash?
    
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.layer.shadowRadius = 8.0
        image.clipsToBounds = true
        return image
    }()
    
    // MARK: - Inits
    convenience init(delegate: CashTitleBannerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
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
    override func setupExtraConfigurations() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapBanner))
        self.bannerImageView.addGestureRecognizer(gesture)
    }
    // MARK: - Setup
    func setup(cash: Cash) {
        titleLabel.attributedText = .combine("digio ".primaryTitleBlue, "Cash".primaryTitleGray)
        self.cash = cash
        if let img = cash.bannerURL{
            bannerImageView.setImage(imageURL: img)
        }
    }
    // MARK: - Actions
    @objc func didTapBanner(sender: UITapGestureRecognizer) {
        guard let cash = self.cash else { return }
        delegate?.didTapBanner(cash: cash)
    }
}
