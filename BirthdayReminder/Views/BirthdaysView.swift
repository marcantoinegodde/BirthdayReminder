//
//  BirthdaysView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct BirthdaysView: View {
    @EnvironmentObject var contactData: ContactData
    @AppStorage(AppStorageKeys.showWelcomeSheet.rawValue) var showWelcomeSheet: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                ScrollView {
                    ForEach(contactData.contacts) {contact in
                        BirthdayItem(firstName: contact.firstName, lastName: contact.lastName, image: contact.image(), birthDate: contact.birthDate(), age: contact.age())
                    }
                    
                }
                .navigationTitle("Birthdays")
                .onAppear(perform: {
                    if showWelcomeSheet == false {
                        contactData.fetchContacts()
                    }
                })
                .alert(Text("Allow Contacts Access"), isPresented: $contactData.showAlert, actions: {
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
        }
    }
}

struct BirthdaysView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContactData = ContactData()
        previewContactData.contacts = [Contact(firstName: "John", lastName: "Doe", birthday: DateComponents(calendar: Calendar(identifier: .gregorian), year: 2000, month: 01, day: 01))]
        return BirthdaysView()
            .environmentObject(previewContactData)
    }
}
