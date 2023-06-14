//
//  AppDelegate.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupNavbar()
        let loginVC = HomeViewController()
        let nav = UINavigationController(rootViewController: loginVC)
        nav.modalPresentationStyle = .overFullScreen
        nav.navigationBar.shadowImage = UIImage()
        self.window?.rootViewController = nav
        window?.makeKeyAndVisible()

        return true
    }

    func setupNavbar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor .black]
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = nil
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().compactAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
            UINavigationBar.appearance().prefersLargeTitles = false
        } else {
            UINavigationBar.appearance().barTintColor = .white
        }
        UINavigationBar.appearance().tintColor = UIColor.gray
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = nil
    }
}

