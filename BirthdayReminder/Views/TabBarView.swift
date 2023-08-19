//
//  TabBarView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            BirthdaysView()
                .tabItem {
                    Label("Anniversaires", systemImage: "birthday.cake")
                }
            AboutView()
                .tabItem {
                    Label("À propos", systemImage: "info.circle")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContactData = ContactData()
        previewContactData.contacts = [Contact(firstName: "John", lastName: "Doe", birthday: DateComponents(calendar: Calendar(identifier: .gregorian), year: 2000, month: 01, day: 01))]
        return TabBarView()
            .environmentObject(previewContactData)
    }
}
