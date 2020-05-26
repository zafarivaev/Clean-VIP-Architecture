//
//  AppDelegate.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let titlesConfigurator = TitlesConfiguratorImplementation()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let titlesViewController = TitlesViewController()
        titlesConfigurator.configure(viewController: titlesViewController)
        
        window = UIWindow()
        window?.rootViewController = titlesViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

