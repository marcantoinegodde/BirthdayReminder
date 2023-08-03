//
//  BirthdaysView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct BirthdaysView: View {
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
                    ForEach(0..<10) {_ in
                        BirthdayItem()
                    }
            }
        }
    }
}

struct BirthdaysView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdaysView()
    }
}
