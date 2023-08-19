//
//  WelcomeManager.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 18/08/2023.
//

import Foundation

enum WelcomeSheet: String {
    case showWelcomeSheet
}

func dismissWelcomeSheet() {
    UserDefaults.standard.set(false, forKey: WelcomeSheet.showWelcomeSheet.rawValue)
}
