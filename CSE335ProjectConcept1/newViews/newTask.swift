//
//  newTask.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//



import Foundation

import SwiftUI

struct newTask: View {
    
    @State var dataController: coreDataController = coreDataController()

    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

        
    @State var newTaskName:String = ""
    @State var courseName:String;
    @State var newDueDate:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var newTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var message:String = ""


    
    
    
    
    var body: some View {
        NavigationView {
            VStack(){
                
                HStack {
                    NavigationLink(
                        destination: HomeView(dataController:dataController, currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),
                        label: {
                            Text("Home")
                                .bold()
                                .foregroundColor(.white)
                        })
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
         .frame(maxWidth: .infinity)
         .background(
            LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
         )
         .cornerRadius(20)
         .padding()
                    
                    NavigationLink(
                        destination: courseDetails(dataController:dataController, userData: userData, currUsername: currUsername, courseName: courseName),
                        label: {
                            Text("Back")
                                .bold()
                                .foregroundColor(.white)
                        })
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
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
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                
                

                VStack(spacing:15){
                    Text("Create New Task").font(.title2)
                        .bold()
                    Text("\(courseName)").font(.title3)
                    Text("\(message)")
                    
                    HStack() {
                        Text("Task Name: ")
                        TextField("Enter the task name", text: $newTaskName)
                        
                    }

                        HStack() {
                            DatePicker("Due Date", selection: $newDueDate );
                            
                        
                    }
                    VStack(){
                        
                        Button(action: {
                            
                            userData.add_task(currUsername, newTaskName, courseName, newDueDate)
                            dataController.add_task(username: currUsername, givenTaskName: newTaskName, givenClassName: courseName, givenDueDate: newDueDate)
                            message = "Succesfully added task \(newTaskName)"
                        }) {
                            
                            Text("Submit").font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }.frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                               LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding()
                        
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

