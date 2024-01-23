import Foundation
import Foundation
import UserNotifications
import CoreLocation

class NotificationManager {
    static let shared = NotificationManager()
    private let notificationDelegate: UserNotificationCenterDelegate = UserNotificationCenterDelegate()
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization(){
        let options:UNAuthorizationOptions = [.alert,.sound,.badge]
        self.notificationCenter.requestAuthorization(options: options) { sucess, error in
            if sucess {
                print("sucess requesting authorization")
                self.setUpDelegate()
            }
            
            if let error = error{
               print("Error: - \(error.localizedDescription)")
            }
        }
    }
    
    func isAuthorizationGranted(completion: @escaping(Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { notificationSettings in
            DispatchQueue.main.async {
                completion(notificationSettings.authorizationStatus == .authorized)
            }
        }
    }
    
    func setUpDelegate(){
        self.notificationCenter.delegate = self.notificationDelegate
    }
    
    func scheduleNotification(trigger:TriggerType){
       let content = UNMutableNotificationContent()
       content.title = "Local Notification!"
       content.body = "This is my first ever location Notification implemetation in SwiftUI"
       content.sound = .default
       content.badge = 1
       
       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger.trigger)
        self.notificationCenter.add(request)
    }
   
    func cancelNotification(){
        self.notificationCenter.removeAllDeliveredNotifications()
        self.notificationCenter.removeAllPendingNotificationRequests()
    }

    enum TriggerType:String{
        case time = "time"
        case calender = "calender"
        case location = "location"
        case now = "now"
        
        var trigger:UNNotificationTrigger{
            switch self {
            case .now:
                return UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            case .time:
                return UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            case .calender:
                let dateComponent = DateComponents(hour: 23,minute: 55,weekday: 4)
                return UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
            case .location:
                let coordinate = CLLocationCoordinate2D(latitude: 40.0, longitude: 50.0)
                let region = CLCircularRegion(center: coordinate, radius: 100, identifier: UUID().uuidString)
                return UNLocationNotificationTrigger(region: region, repeats: true)
            }
        }
    }
}
