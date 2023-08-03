//
//  AboutView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 03/08/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Text("À propos")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }.padding()
            
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
