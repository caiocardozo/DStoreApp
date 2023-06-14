//
//  HomeViewController.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import UIKit

final class HomeViewController: UIViewController, HasCustomView {
    // MARK: - Typealias
    typealias CustomView = HomeView
    var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupObservables()
        viewModel.loadData()
    }
    
    private func setupObservables() {
        viewModel.isLoading = { [weak self] loading in
            self?.isLoading(loading: loading)
        }
        viewModel.error = { [weak self] error in
           // TODO: Messagem de erro
        }
    }
    
    private func setupDelegate() {
        // TODO: setup delegates
    }
}
