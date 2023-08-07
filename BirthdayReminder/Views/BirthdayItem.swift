//
//  BirthdayItem.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct BirthdayItem: View {
    var firstName: String
    var lastName: String
    var image: Image?
    var birthDate: String
    var age: Int?
    
    var body: some View {
        HStack() {
            if let image = image {
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50, alignment: .center)
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
            }
            VStack(alignment: .leading) {
                Text("\(firstName) \(lastName)")
                    .font(.title3)
                    .bold()
                Text(birthDate)
            }
            Spacer()
            HStack() {
                Text("🎂")
                    .font(.largeTitle)
                if let age = age {
                    Text("\(age) years old")
                        .font(.title3)
                        .bold()
                }
            }
            
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        
    }
}

struct BirthdayItem_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayItem(firstName: "John", lastName: "Doe", birthDate: "01/01/2000", age: 23)
    }
}
