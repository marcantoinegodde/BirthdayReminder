//
//  NotificationPermissionView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 12/08/2023.
//

import SwiftUI

struct NotificationPermissionView: View {
    var body: some View {
        VStack(spacing: 0) {
            NotificationSkeletonAssembly()
                .frame(maxWidth: .infinity)
                .background(Color(.systemFill))
            
            
            ZStack {
                Color.primary
                    .colorInvert()
                    .ignoresSafeArea()
                
                VStack() {
                    Text("Get notified of upcoming birthdays")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Receive notifications about your contacts' upcoming birthdays so you never forget to wish them.")
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
                    .padding(.vertical)
                    .font(.headline)
                }
            }
        }
    }
}

struct NotificationPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPermissionView()
    }
}
