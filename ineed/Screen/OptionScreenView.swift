//
//  OptionScreenView.swift
//  ineed
//
//  Created by Bryan Cuadrado on 23/01/24.
//
import SwiftUI
import Foundation

struct OptionScreenView: View {
    var body: some View {
        VStack {
            Button("Notification Now") {
                Task {
                    NotificationManager.shared.scheduleNotification(trigger: .now)
                }
            }
        }
    }
}
