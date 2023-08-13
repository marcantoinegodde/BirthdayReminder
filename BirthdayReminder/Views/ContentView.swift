//
//  ContentView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State var shouldPresentSheet = true
    
    var body: some View {
        TabBarView()
            .sheet(isPresented: $shouldPresentSheet, content: {
                WelcomeView()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
