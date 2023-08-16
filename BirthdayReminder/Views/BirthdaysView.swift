//
//  BirthdaysView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct BirthdaysView: View {
    @StateObject var contactData = ContactData()
    
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
                .onAppear(perform: contactData.fetchContacts)
            }
        }
    }
}

struct BirthdaysView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContactData = ContactData()
        previewContactData.contacts = [Contact(firstName: "John", lastName: "Doe", birthday: DateComponents(calendar: Calendar(identifier: .gregorian), year: 2000, month: 01, day: 01))]
        return BirthdaysView(contactData: previewContactData)
    }
}
