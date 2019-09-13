//
//  AppDelegate.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainNC = UINavigationController()
        mainNC.setViewControllers([MainViewController()], animated: true)
        window?.rootViewController = mainNC
        window?.makeKeyAndVisible()
        
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {
      
    }


}

