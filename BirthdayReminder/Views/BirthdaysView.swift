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
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Text("Birthdays")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }.padding()
            
            Spacer()
            
            ScrollView {
                ForEach(contactData.contacts) {contact in
                    BirthdayItem(firstName: contact.firstName, lastName: contact.lastName, image: contact.image(), birthDate: contact.birthDate(), age: contact.age())
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .onAppear(perform: contactData.fetchContacts)
    }
}

struct BirthdaysView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdaysView()
    }
}
