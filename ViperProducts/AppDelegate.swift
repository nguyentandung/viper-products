//
//  AppDelegate.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var typePush = 1

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Thread.sleep(forTimeInterval: 3.0)
        
        configLocalNotification()
        
        return true
    }
    
   
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func configLocalNotification() {
        UNUserNotificationCenter.current().delegate = self
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                    if granted {
                        print("User gave permissions for local notifications")
                    }
                }
    }
    
    func pushToScreenFromNotification() {
        if let navigationVC = window?.rootViewController as? UINavigationController {
            if let viewcontroller = navigationVC.storyboard?.instantiateViewController(identifier: "ProductsViewController") as? ProductsViewController {
                navigationVC.pushViewController(viewcontroller, animated: true)
            }
            
        }
    }
}

extension AppDelegate : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           
           completionHandler([.banner, .badge, .sound])
       }
       
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        NotificationCenter.default.post(name: Notification.Name(KEY_RECEIVE_NOTIFICATION), object: nil)
        
       }
}
