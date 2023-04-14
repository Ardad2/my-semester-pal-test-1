//
//  editUser.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/13/23.
//

import Foundation

import SwiftUI

struct editUser: View {
    
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String
    
    @State var newFirstName:String
    @State var newLastName:String
    @State var newEmail:String
    @State var newPassword:String
    
    @State private var showPassword: Bool = false

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15)
            {
                Spacer()
                
                Text("Editing Profile for \(currUsername)")                        .font(.title)
                    .bold()
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .padding()
                
                TextField("First Name", text: $newFirstName).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                TextField("Last Name", text: $newLastName).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                TextField("Email", text: $newEmail).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                
                HStack{
                    Group {
                        if showPassword {
                            TextField("Enter your password", text:$newPassword)
                        }
                        else {
                            SecureField("Password", text: $newPassword)
                        }
                        
                    }.padding(10) .overlay { RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)}
                }.padding(.horizontal)
                
                VStack {
                    Button(action:
                            
                            {

                            userData.change_profile_details(currUsername, newPassword, newEmail, newFirstName, newLastName)
                        
                        
                    }
                    
                    ){

                            
                            Text("Save Changes")                            .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }                    .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                               LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding()
                    
                    NavigationLink(
                       /* destination: homeScreen(courseData: courseData, taskData: taskData
                                               ),*/
                        
                        destination: HomeView(currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),

                        
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Go Back")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                        
  /*                      Text("Go Back")
                            .foregroundColor(.black)
                    }                    .frame(height: 50)
                        .frame(maxWidth: .infinity)*/

                        
                        /*
                        
                        Button {

            
                            loginStatus = "Cannot register new accounts!"
                        } label : {
                            Text("Register")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                         */
                    }
                
                
            }
        }
    }
}
