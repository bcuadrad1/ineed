import Foundation
import UserNotifications

class UserNotificationCenterDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    override init() {
        super.init()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler handler: @escaping () -> Void) {
        print("didReceive notification")
        print("\(response.notification.request.content.userInfo)")

        handler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler handler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification will be presented")
        print("\(notification.request.content.userInfo)")
        
        handler( [.alert, .badge, .sound])
    }
}

