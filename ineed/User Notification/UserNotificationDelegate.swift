import Foundation
import UserNotifications

class UserNotificationCenterDelegate: NSObject, UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler handler: @escaping () -> Void) {
        print("notification received")

        handler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler handler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification will be presented")
        
        let userInfo = notification.request.content.userInfo
        if let isCustom =  userInfo["is_custom"] as? Bool, isCustom {
            print("is custom \(isCustom)")
            
            NotificationManager.shared.scheduleNotification(trigger: .now)
            handler([])
        }
        
        handler( [.alert, .badge, .sound])
    }
}


