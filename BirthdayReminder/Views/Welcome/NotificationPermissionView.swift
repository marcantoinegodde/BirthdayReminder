//
//  NotificationPermissionView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 12/08/2023.
//

import SwiftUI

struct NotificationPermissionView: View {
    @StateObject var notificationsPermissionManager = NotificationsPermissionManager()
    @AppStorage(AppStorageKeys.showWelcomeSheet.rawValue) var showWelcomeSheet: Bool = true
    
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
                        notificationsPermissionManager.requestAuthorization(completion: {
                            showWelcomeSheet = false
                        })
                    }, label: {
                        Text("Enable notifications")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .font(.headline)
                    .padding(.horizontal)
                    .alert(Text("Allow Notifications Access"), isPresented: $notificationsPermissionManager.showAlert, actions: {
                        Button("Cancel", role: .cancel, action: {})
                        Button("Settings", action: {
                            if let bundleId = Bundle.main.bundleIdentifier,
                               let url = URL(string: "\(UIApplication.openSettingsURLString)&path=APPNAME/\(bundleId)")
                            {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                            
                        })
                    }, message: {
                        Text("Press settings to update your notifications preferences or cancel to deny access.")
                    })
                    
                    Button(action: {
                        showWelcomeSheet = false
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
