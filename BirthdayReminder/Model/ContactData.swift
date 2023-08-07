//
//  ContactData.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 07/08/2023.
//

import Foundation
import SwiftUI
import Contacts

struct Contact: Identifiable, Hashable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var imageData: Data?
    var birthday: DateComponents
    
    func image() -> Image? {
        if let imageData = imageData {
            return Image(uiImage: UIImage(data: imageData)!)
        }
        return nil
    }
    
    func birthDate() -> String {
        if birthday.year != nil {
            return birthday.date!.formatted(.dateTime.day().month(.wide).year())
        } else {
            return birthday.date!.formatted(.dateTime.day().month(.wide))
        }
    }
    
    func age() -> Int? {
        if birthday.year != nil {
            let now = Date()
            return Int(Calendar.current.dateComponents([.year], from: birthday.date!, to: now).year!)
        }
        return nil
    }
    
    
}

class ContactData: ObservableObject {
    
    @Published var contacts = [Contact]()
    
    func fetchContacts() {
        DispatchQueue.main.async {
            self.contacts.removeAll()
            let store = CNContactStore()
            
            let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactThumbnailImageDataKey, CNContactBirthdayKey] as [CNKeyDescriptor]
            let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
            do {
                try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, _ in
                    
                    if let birthday = contact.birthday {
                        self.contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, imageData: contact.thumbnailImageData, birthday: birthday))
                        
                    }
                })
                
                print("Fetched contacts: \(self.contacts)")
            } catch {
                print("Failed to fetch contact, error: \(error)")
            }
        }
    }
}
