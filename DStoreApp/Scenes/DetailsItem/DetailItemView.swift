//
//  DetailItemView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 16/06/23.
//

import UIKit
import SnapKit

final class DetailItemView: BaseView {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        
        return scroll
    }()
    lazy var contentView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bannerImageView)
        contentView.addSubview(infoLabel)
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
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(44)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setup(name: String, imageBanner: String, info: String) {
        self.infoLabel.text = name
    }

}
