import Foundation
import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    let options: UNAuthorizationOptions = [.alert, .badge, .sound]
    let notificationDelegate: UserNotificationCenterDelegate = UserNotificationCenterDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if success {
                print("Permission approved!")
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                    UNUserNotificationCenter.current().delegate = self.notificationDelegate
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        /// handle device token
        print("this is the token: \(deviceToken)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("failed token registration")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("notification arrived!")

        completionHandler(.newData)
    }
}



extension Data {
    func parseToString() -> String {
        /// parsed solution found in
        /// https://stackoverflow.com/questions/9372815/how-can-i-convert-my-device-token-nsdata-into-an-nsstring
        let token = self.map { data in String(format: "%02.2hhx", data) }
        return token.joined()
    }
}
