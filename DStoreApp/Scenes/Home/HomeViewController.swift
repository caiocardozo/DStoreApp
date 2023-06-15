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
            debugPrint(error)
        }
        viewModel.reloadSpotlightCollection = {
            self.customView.spotlightCollectionView.reloadData()
        }
    }
    
    private func setupDelegate() {
        // TODO: setup delegates
        customView.spotlightCollectionView.delegate = self
        customView.spotlightCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.stores?.spotlight?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier, for: indexPath) as! SpotlightCollectionViewCell
        cell.setup(spotlight: (viewModel.stores?.spotlight?[indexPath.row])!)
        return cell
    }
}
// MARK: - UICollectionViewFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //if collectionView == customView.spotlightCollectionView {
            if let spotlight = viewModel.stores?.spotlight {
//                if spotlight.isEmpty {
//                    return CGSize(width: schedulesCollectionView.frame.size.width, height: heightEmptyScheduleCollectionView)
//                } else {
                    if spotlight.count > 1 {
                        return CGSize(width: UIScreen.main.bounds.width - CGFloat(48), height: 230)
                    } else {
                        return CGSize(width: UIScreen.main.bounds.width - 16, height: 230)
                    }
                    
                //}
            } else {
                return CGSize(width: UIScreen.main.bounds.width - 16, height: 230)
            }
     //   }
    }
}
