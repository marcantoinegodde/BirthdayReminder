//
//  NotificationsPermissionManager.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 17/08/2023.
//

import Foundation
import UserNotifications

class NotificationsPermissionManager: ObservableObject {
    @Published var notificationsAuthorization: UNAuthorizationStatus = .notDetermined
    @Published var showAlert: Bool = false
    
    let center = UNUserNotificationCenter.current()
    
    init() {
        currentAuthorization()
    }
    
    func currentAuthorization() {
        center.getNotificationSettings { settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .authorized:
                    self.notificationsAuthorization = .authorized
                case .notDetermined:
                    self.notificationsAuthorization = .notDetermined
                default:
                    self.notificationsAuthorization = .denied
                }
            }
        }
    }
    
    func requestAuthorization() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                if granted {
                    self.currentAuthorization()
                }
                else {
                    self.showAlert = true
                }
            }
        }
    }
    
}
