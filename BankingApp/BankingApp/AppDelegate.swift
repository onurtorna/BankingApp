//
//  AppDelegate.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Set the credentials first. This can be also done by a login action
        SessionManager.shared.setNetworkCredentials(username: Global.Network.defaultUsername,
                                                    password: Global.Network.defaultPassword)


        return true
    }
}

