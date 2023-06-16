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
        setupBack()
        setupDelegate()
        setupObservables()
        viewModel.loadData()
    }
    
    private func setup() {
        title = ""
    }
    private func setupObservables() {
        viewModel.isLoading = { [weak self] loading in
            self?.isLoading(loading: loading)
        }
        viewModel.error = { [weak self] error in
           // TODO: Messagem de erro
            debugPrint(error)
        }
        viewModel.reloadCollections = {
            self.reloadCollections()
        }
    }
    
    private func reloadCollections() {
        if let cash = viewModel.stores?.cash {
            self.customView.setupCash(cash: cash)
        }
        self.customView.spotlightCollectionView.reloadData()
        self.customView.productsCollectionView.reloadData()
    }
    
    private func setupDelegate() {
        // TODO: setup delegates
        customView.spotlightCollectionView.delegate = self
        customView.spotlightCollectionView.dataSource = self
        customView.productsCollectionView.delegate = self
        customView.productsCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == customView.spotlightCollectionView {
            return viewModel.stores?.spotlight?.count ?? 0
        } else {
            return viewModel.stores?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == customView.spotlightCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier, for: indexPath) as! SpotlightCollectionViewCell
            cell.setup(spotlight: (viewModel.stores?.spotlight?[indexPath.row])!)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
            cell.setup(product: (viewModel.stores?.products?[indexPath.row])!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == customView.spotlightCollectionView {
            self.push(DetailItemViewController(name: viewModel.stores?.spotlight?[indexPath.row].name ?? "",
                                               imageBanner: viewModel.stores?.spotlight?[indexPath.row].bannerURL ?? "",
                                               info: viewModel.stores?.spotlight?[indexPath.row].info ?? ""))
        } else {
            self.push(DetailItemViewController(name: viewModel.stores?.products?[indexPath.row].name ?? "",
                                               imageBanner: viewModel.stores?.products?[indexPath.row].imageURL ?? "",
                                               info: viewModel.stores?.products?[indexPath.row].info ?? ""))
        }
    }
}
// MARK: - UICollectionViewFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == customView.spotlightCollectionView {
            if let spotlight = viewModel.stores?.spotlight {
                if spotlight.count > 1 {
                    return CGSize(width: UIScreen.main.bounds.width - CGFloat(48), height: 230)
                } else {
                    return CGSize(width: UIScreen.main.bounds.width - 16, height: 230)
                }
            } else {
                return CGSize(width: UIScreen.main.bounds.width - 16, height: 230)
            }
        } else {
            if let spotlight = viewModel.stores?.products {
                    return CGSize(width: 80, height: 80)
            } else {
                return CGSize(width: UIScreen.main.bounds.width - 16, height: 230)
            }
        }
    }
}
