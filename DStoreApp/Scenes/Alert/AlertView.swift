//
//  AlertView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func didTapOkButton()
}

class AlertView: UIView {
    weak var delegate: AlertViewDelegate?
    
    private lazy var background: UIVisualEffectView = {
        let blurEffect     = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    private lazy var wrapper: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius  = 8.0
        view.layer.cornerRadius  = 20.0
        view.layer.shadowOffset  = .zero
        view.layer.shadowColor   = UIColor.black.cgColor
        view.backgroundColor = .white
        return view
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = .gray
        return view
    }()
    private var wrapperBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.appColor(.primaryColorBlue)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    private var message: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.appColor(.primaryColorBlue)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setupExtraConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(delegate: AlertViewDelegate) {
        self.init()
        self.delegate = delegate
    }
}

// MARK: - Setups
extension AlertView {
    private func addViews() {
        self.backgroundColor = .clear
        self.addSubview(wrapper)
        wrapper.addSubview(separatorView)
        wrapper.addSubview(wrapperBackground)
        wrapper.addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(message)
        wrapper.addSubview(okButton)
    }
    
    private func addConstraints() {
        wrapper.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        wrapperBackground.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(34)
        }
        separatorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(4)
            make.width.equalTo(60)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(32)
            make.trailing.leading.equalToSuperview().inset(32)
        }
        okButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(stackView.snp.bottom).offset(32)
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(24)
        }
    }
    func setupExtraConfiguration() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapButton))
        self.okButton.addGestureRecognizer(gesture)
    }
    
    // MARK: - Actions
    @objc func didTapButton(sender: UITapGestureRecognizer) {
        delegate?.didTapOkButton()
    }
}
// MARK: - Public Functions
extension AlertView {
    func configureAlert(_ title: String, _ message: String) {
        self.title  .text = title
        self.message.text = message
    }
    func show() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = UIColor(white: CGFloat(APPConstantsDimensions.lowColorModal), alpha: CGFloat(APPConstantsDimensions.lowAlphaColorModal))
        })
    }
}
