//
//  WelcomeManager.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 18/08/2023.
//

import Foundation

class WelcomeManager: ObservableObject {
    @Published var isPresented: Bool = true
    
    func dismiss() {
        self.isPresented = false
    }
}
