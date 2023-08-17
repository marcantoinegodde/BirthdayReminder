//
//  ContactsPermissionManager.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 16/08/2023.
//

import Foundation
import SwiftUI
import Contacts

class ContactsPermissionManager: ObservableObject {
    @Published var contactsAuthorization: CNAuthorizationStatus = .notDetermined
    @Published var showAlert: Bool = false
    
    private let store = CNContactStore()
    
    init() {
        refreshCurrentAuthorization()
    }
    
    func currentAuthorization() -> CNAuthorizationStatus {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            return .authorized
        case .notDetermined:
            return .notDetermined
        default:
            return .denied
        }
    }
    
    private func refreshCurrentAuthorization() {
        self.contactsAuthorization = self.currentAuthorization()
    }
    
    func requestAuthorization() {
        store.requestAccess(for: .contacts) { success, _ in
            if success {
                DispatchQueue.main.async {
                    self.refreshCurrentAuthorization()
                }
            }
            else {
                self.showAlert = true
            }
        }
    }
}
