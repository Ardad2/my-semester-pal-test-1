//
//  userDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/13/23.
//

import Foundation

import SwiftUI

struct userDetails: View {
    @State var dataController: coreDataController = coreDataController()

    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String
    
    var body: some View {
        NavigationView {
            VStack() {

                HStack {
                    NavigationLink(
                        destination: HomeView(dataController: dataController, currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),
                        label: {
                            Text("Home")
                                .bold()
                                .foregroundColor(.white)
                        })
                        .navigationBarHidden(true)
         .frame(maxWidth: .infinity)
         .background(
            LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
         )
         .cornerRadius(20)
         .padding()
                    

                }            .padding()
                    .background(Color.black)
                    .frame(height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                
                VStack(spacing:15) {
                    HStack {
                        Text("Username: ").font(.title2)
                        Text("\(currUsername)").font(.title2)
                            .bold()
                    }
                    HStack {
                        Text("Name: ").font(.title2)
                        Text("\(userData.get_first_name(username: currUsername)) \(userData.get_last_name(username: currUsername))  ").font(.title2)
                            .bold()
                    }
                    HStack {
                        Text("Email Address: ").font(.title2)

                        Text("\(userData.get_email(username: currUsername))").font(.title2)
                            .bold()
                    }
                }
                Spacer()
                
                VStack {
                    
                    
                    NavigationLink(
                        
                        destination: editUser(dataController: dataController, userData: userData, currUsername: currUsername, statusMessage: "", newFirstName: userData.get_first_name(username: currUsername), newLastName: userData.get_last_name(username: currUsername), newEmail: userData.get_email(username: currUsername), newPassword: ""),
                        
                        // destination: HomeView(currUsername: currUsername, userData: userData),
                        label: {
                            Text("Edit Profile").font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }).frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                        .navigationBarHidden(true)
                
                    
                    
                }
            }
        }
    }
}
