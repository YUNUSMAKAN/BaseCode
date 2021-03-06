//
//  AppDelegate.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 30.07.2020.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setLanguage()
        AppManager.shared.setReachability()
        firebase(application)
        setKeyboard()
//        setLocalePushNotification()
        
        
        if #available(iOS 13.0, *) { }
        else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = AnimatedSplashViewController()
            self.window?.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UserDefaults.standard.setValue(0, forKey: Constants.Badge.badgeNumber)
        UIApplication.shared.applicationIconBadgeNumber = 0
    }


    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    private func setKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    private func setLanguage() {
        AppManager.shared.appLaunchLanguage()
    }

}

