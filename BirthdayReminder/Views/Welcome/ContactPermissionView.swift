//
//  ContactPermissionView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 12/08/2023.
//

import SwiftUI

struct ContactPermissionView: View {
    @StateObject var contactsPermissionManager = ContactsPermissionManager()
    @StateObject var notificationsManager = NotificationsPermissionManager()
    @AppStorage(AppStorageKeys.showWelcomeSheet.rawValue) var showWelcomeSheet: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Need Permissions")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Text("In order for you to get birthdays information, you need to give contacts permssions.")
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.vertical)
                
                HStack {
                    Image(systemName: "person.crop.circle").foregroundColor(Color.blue)
                        .font(.system(size: 40))
                        .padding(.horizontal, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Contacts")
                            .font(.system(size: 20))
                            .bold()
                            .layoutPriority(1)
                        
                        Text("Allow access to your contacts")
                            .font(.system(size: 15))
                            .foregroundColor(Color(.secondaryLabel))
                        
                    }
                    Spacer()
                    Button(action: contactsPermissionManager.requestAuthorization, label: {
                        if contactsPermissionManager.contactsAuthorization == .authorized {
                            Text("Allowed")
                                .bold()
                                .textCase(.uppercase)
                        }
                        else {
                            Text("Allow")
                                .bold()
                                .textCase(.uppercase)
                        }
                    })
                    .buttonStyle(.bordered)
                    .cornerRadius(30)
                    .disabled(contactsPermissionManager.contactsAuthorization == .authorized)
                    .alert(Text("Allow Contacts Access"), isPresented: $contactsPermissionManager.showAlert, actions: {
                        Button("Cancel", role: .cancel, action: {})
                        Button("Settings", action: {
                            if let bundleId = Bundle.main.bundleIdentifier,
                               let url = URL(string: "\(UIApplication.openSettingsURLString)&path=APPNAME/\(bundleId)")
                            {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                            
                        })
                    }, message: {
                        Text("Cannot display birthdays of your contacts without access. Press settings to update or cancel to deny access.")
                    })
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .cornerRadius(15)
                
                
                Spacer()
                
                if notificationsManager.notificationsAuthorization == .authorized {
                    Button(action: {
                        showWelcomeSheet = false
                    }, label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .font(.headline)
                    .padding()
                } else {
                    NavigationLink(destination: NotificationPermissionView(), label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .font(.headline)
                    .padding()
                }
            }
            .padding()
            .background(Color(.systemGroupedBackground))
        }
    }
}


struct ContactPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPermissionView()
    }
}
