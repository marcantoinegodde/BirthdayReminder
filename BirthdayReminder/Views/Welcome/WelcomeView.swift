//
//  WelcomeView.swift
//  BirthdayReminder
//
//  Created by Marc-Antoine Godde on 11/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack() {
            VStack() {
                
                Spacer()
                
                Image("Icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                Text("Welcome to Birthdays")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack(alignment: .leading) {
                    
                    HStack() {
                        Image(systemName: "gift.fill")
                            .renderingMode(.original)
                            .font(.system(size: 45))
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("See next occuring birthdays")
                                .bold()
                            Text("Get your contacts birthday information at a glance.")
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                    }
                    .padding(.horizontal)
                    
                    HStack() {
                        Image(systemName: "bell.badge.fill")
                            .renderingMode(.original)
                            .font(.system(size: 45))
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Get informed")
                                .bold()
                            Text("Receive notifications on the day of the event.")
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                    }
                    .padding(.horizontal)
                    
                    HStack() {
                        Image(systemName: "message.fill")
                            .renderingMode(.original)
                            .font(.system(size: 45))
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Keep in touch")
                                .bold()
                            Text("Wish your contact a happy birthday.")
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                
                Spacer()
                
                NavigationLink(destination: ContactPermissionView(), label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .font(.headline)
                .padding()
                
            }
            .padding()
            .background(Color(.secondarySystemFill))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
