//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var welcomeManager = WelcomeManager()
    
    var body: some View {
        TabBarView()
            .sheet(isPresented: $welcomeManager.isPresented, content: {
                WelcomeView()
                    .environmentObject(welcomeManager)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
