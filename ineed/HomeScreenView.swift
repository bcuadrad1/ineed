import SwiftUI
import UserNotifications

struct HomeScreenView: View {
    @State var isSplashActive:Bool = false
    
    var body: some View {
        NavigationView(){
            if !isSplashActive {
                Image("splash")
                    .resizable()
                    .scaledToFill()
            } else {
                TabView {
                    LandScreenView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(1)
                    ListScreenView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("List")
                        }
                        .tag(2)
                    VStack {
                        Button("Notification Now") {
                            Task {
                                NotificationManager.shared.scheduleNotification(trigger: .now)
                            }
                        }
                        Button("Notification 5 sec") {
                            Task {
                                NotificationManager.shared.scheduleNotification(trigger: .time)
                            }
                        }
                    }
                    .tabItem {
                        Image(systemName: "circle.hexagongrid.circle.fill")
                        Text("Options")
                    }
                    .tag(3)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("iNeed")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isSplashActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
