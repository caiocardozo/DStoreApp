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
        window = UIWindow(frame: UIScreen.main.bounds)
        setupNavbar()
        let rootVC = HomeViewController()
        let nav = UINavigationController(rootViewController: rootVC)
        nav.modalPresentationStyle = .overFullScreen
        nav.navigationBar.shadowImage = UIImage()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
    
    func setupNavbar() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = nil
    }
}

