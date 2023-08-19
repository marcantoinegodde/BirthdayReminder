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
        if CNContactStore.authorizationStatus(for: .contacts) == .authorized {
            self.contacts.removeAll()
            
            DispatchQueue.global(qos: .userInitiated).async {
                let store = CNContactStore()
                
                let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactThumbnailImageDataKey, CNContactBirthdayKey] as [CNKeyDescriptor]
                let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
                
                do {
                    try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, _ in
                        if let birthday = contact.birthday {
                            let newContact = Contact(firstName: contact.givenName, lastName: contact.familyName, imageData: contact.thumbnailImageData, birthday: birthday)
                            
                            DispatchQueue.main.async {
                                self.contacts.append(newContact)
                                self.contacts.sort {
                                    self.daysDifferenceFromToday(dateComponents: $0.birthday) < self.daysDifferenceFromToday(dateComponents: $1.birthday)
                                }
                            }
                        }
                    })
                    
                    print("Fetched contacts: \(self.contacts)")
                } catch {
                    print("Failed to fetch contact, error: \(error)")
                }
            }
        }
    }
    
    func daysDifferenceFromToday(dateComponents: DateComponents) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let todayDateComponents = calendar.dateComponents([.day, .month], from: currentDate)
        let targetDateComponents = DateComponents(calendar: calendar, month: dateComponents.month, day: dateComponents.day)
        
        let date1 = calendar.date(from: todayDateComponents)!
        let date2 = calendar.date(from: targetDateComponents)!
        
        // Calculate the difference in days between the two dates
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        var daysDifference = components.day!
        
        if daysDifference < 0 {
            daysDifference += 365
        }
        
        return daysDifference
    }
}
