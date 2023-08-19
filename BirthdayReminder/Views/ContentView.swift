//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(WelcomeSheet.showWelcomeSheet.rawValue) var showWelcomeSheet: Bool = true
    
    var body: some View {
        TabBarView()
            .sheet(isPresented: $showWelcomeSheet, content: {
                WelcomeView()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
