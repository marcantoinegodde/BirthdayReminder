//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(AppStorageKeys.showWelcomeSheet.rawValue) var showWelcomeSheet: Bool = true
    @StateObject private var contactData = ContactData()
    
    var body: some View {
        TabBarView()
            .environmentObject(contactData)
            .sheet(isPresented: $showWelcomeSheet, onDismiss: contactData.fetchContacts, content: {
                WelcomeView()
                    .interactiveDismissDisabled()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
