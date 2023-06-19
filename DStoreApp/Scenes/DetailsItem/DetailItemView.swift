//
//  DetailItemView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 16/06/23.
//

import UIKit
import SnapKit

protocol DetailItemViewDelegate: AnyObject {
    func didTapUrl(url: URL)
}

final class DetailItemView: BaseView {
    
    weak var delegate: DetailItemViewDelegate?
    
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
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var infoLabel: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 16.0)
        text.isEditable = false
        text.dataDetectorTypes = [.link]
        text.isUserInteractionEnabled = true
        text.delegate = self
       return text
    }()
    
    // MARK: - Inits
    convenience init(delegate: DetailItemViewDelegate) {
        self.init()
        self.delegate = delegate
    }
    // MARK: - Setups
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
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
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(44)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    func setup(info: String) {
        self.infoLabel.text = info
    }
}

// MARK: - UITextViewDelegate
extension DetailItemView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
            delegate?.didTapUrl(url: URL)
        return false
    }
}

