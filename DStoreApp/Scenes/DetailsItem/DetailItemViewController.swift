//
//  DetailItemViewController.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 16/06/23.
//

import UIKit

final class DetailItemViewController: UIViewController, HasCustomView {
    // MARK: - Typealias
    typealias CustomView = DetailItemView
    
    var name: String?
    var info: String?
    
    // MARK: - Init
    init(name: String, info: String) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.info = info
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupData()
    }
    private func setup() {
        setupCloseButton()
        title = self.name
    }
    private func setupData() {
        customView.setup(info: info ?? "")
    }
}
// MARK: - Extension Show
extension DetailItemViewController {
    static func show(in host: UIViewController, name: String, info: String) {
        let alert = DetailItemViewController(name: name, info: info)
        let nav = UINavigationController(rootViewController: alert)
        nav.modalPresentationStyle = .pageSheet
        host.present(nav, animated: true, completion: nil)
    }
}
// MARK: - DetailItemViewDelegate
extension DetailItemViewController: DetailItemViewDelegate {
    func didTapUrl(url: URL) {
        UIApplication.shared.open(url)
    }
}
