//
//  NotificationSkeletonAssembly.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 13/08/2023.
//

import SwiftUI

struct NotificationSkeletonAssembly: View {
    var body: some View {
            VStack {
                Text("08:30")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.system(size: 60))
                    .padding(.top)
                
                NotificationSkeleton()
                    .shadow(radius: 20)
                
                Spacer()
            }
            .padding()
            .frame(width: 350, height: 400)
            .background(Color(.systemFill))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct NotificationSkeletonAssembly_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSkeletonAssembly()
    }
}
