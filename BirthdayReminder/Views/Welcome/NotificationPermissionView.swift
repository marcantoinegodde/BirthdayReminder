//
//  NotificationPermissionView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 12/08/2023.
//

import SwiftUI

struct NotificationPermissionView: View {
    var body: some View {
        ZStack {
            Color(.systemFill)
                .ignoresSafeArea()
            VStack() {
                NotificationSkeletonAssembly()
                    .padding(.top)
                Spacer()
            }
        }
        .overlay(alignment: .bottom, content: {
            ZStack {
                Color.primary
                    .colorInvert()
                    .ignoresSafeArea()
                
                VStack() {
                    Spacer()
                    
                    Text("Get informed of upcomming birthdays")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Receive notifications about upcomming birthdays of your contacts so you never forget to wish one.")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        print("Enable notifications")
                    }, label: {
                        Text("Enable notifications")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .font(.headline)
                    .padding(.horizontal)
                    
                    Button(action: {
                        print("Later")
                    }, label: {
                        Text("Later")
                    })
                    .padding(.top)
                    .font(.headline)
                }
            }
            .frame(height: 450)
        })
    }
}

struct NotificationPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPermissionView()
    }
}
