//
//  AppDelegate.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ViewController()
        controller.view.backgroundColor = .red
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }
}
