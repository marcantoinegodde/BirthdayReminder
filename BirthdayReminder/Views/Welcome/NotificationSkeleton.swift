//
//  NotificationSkeleton.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 13/08/2023.
//

import SwiftUI

struct NotificationSkeleton: View {
    var body: some View {
        
        HStack {
            Image("Icon")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.secondary)
                    .frame(width: 130, height: 10)
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.secondary)
                    .frame(width: 200, height: 8)
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.secondary)
                    .frame(width: 200, height: 8)
            }
            
        }
        .padding()
        .background(Color(.systemFill))
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .foregroundColor(.white)
    }
}

struct NotificationSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSkeleton()
    }
}
