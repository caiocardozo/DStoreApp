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
    var imageBanner: String?
    var info: String?
    
    // MARK: - Init
    init(name: String, imageBanner: String, info: String) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.imageBanner = imageBanner
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
        title = "Detail"
    }
    private func setupData() {
        customView.setup(name: name ?? "", imageBanner: imageBanner ?? "", info: info ?? "")
    }
}
