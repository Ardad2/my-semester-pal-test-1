//
//  userDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/13/23.
//

import Foundation

import SwiftUI

struct userDetails: View {
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    NavigationLink(
                       /* destination: homeScreen(courseData: courseData, taskData: taskData
                                               ),*/
                        
                        destination: HomeView(currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),

                        
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                }
                VStack() {
                    HStack {
                        Text("Name: ")
                        Text("\(userData.get_first_name(username: currUsername)) \(userData.get_last_name(username: currUsername))  ")
                    }
                    HStack {
                        Text("Email: ")
                        Text("\(userData.get_email(username: currUsername))")
                    }

                    
                    NavigationLink(
                        
                        destination: editUser(userData: userData, currUsername: currUsername, newFirstName: userData.get_first_name(username: currUsername), newLastName: userData.get_last_name(username: currUsername), newEmail: userData.get_email(username: currUsername), newPassword: ""),
                        
                       // destination: HomeView(currUsername: currUsername, userData: userData),
                        label: {
                            Text("Edit Profile")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
            }
        }
    }
}
