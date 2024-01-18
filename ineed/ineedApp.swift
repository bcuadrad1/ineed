import SwiftUI

@main
struct ineedApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
    }
}
