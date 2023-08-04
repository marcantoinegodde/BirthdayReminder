//
//  BirthdayItem.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct BirthdayItem: View {
    @State private var firstName = "John"
    @State private var lastName = "Doe"
    @State private var birthDate = "01/01/2000"
    @State private var age = 23
    
    var body: some View {
        HStack() {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 40))
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
                    Text("\(age) years old")
                        .font(.title3)
                        .bold()
                    
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
        BirthdayItem()
    }
}
