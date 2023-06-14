//
//  HomeView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Funcionando"
        return label
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(titleLabel)
    }
    
    override func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

