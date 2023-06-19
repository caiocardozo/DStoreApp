//
//  AlertViewController.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

class AlertViewController: UIViewController, HasCustomView {
    
    // MARK: - Properts
    typealias CustomView = AlertView
    private var hasShown = false
    var callback: (() -> Void)?
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = AlertView(delegate: self)
        view = customView
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !hasShown {
            hasShown = true
            customView.show()
        }
    }
    
    // MARK: - Setups
    private func setup(_ title: String, _ message: String) {
        customView.configureAlert(title, message)
    }
    
    private func dismiss() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false) {
            self.callback?()
        }
    }
}

// MARK: - Static Functions
extension AlertViewController {
    static func show(in host: UIViewController, title: String, message: String, callback:(() -> Void)? = nil) {
        let alert = AlertViewController()
        alert.setup(title, message)
        alert.callback = callback
        alert.modalPresentationStyle = .overFullScreen
        host.present(alert, animated: true)
    }
}
// MARK: - AlertViewDelegate
extension AlertViewController: AlertViewDelegate {
    func didTapOkButton() {
        self.dismiss()
    }
}
