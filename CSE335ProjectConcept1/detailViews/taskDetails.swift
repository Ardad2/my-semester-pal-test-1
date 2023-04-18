//
//  taskDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI

struct taskDetails: View {
    
    @State var dataController: coreDataController = coreDataController()

    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String



    var courseName:String
    var taskName:String
    
    var body: some View {
        NavigationView{
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
                        destination: courseDetails(dataController: dataController, userData: userData, currUsername: currUsername, courseName: courseName),
                        label: {
                            Text("Course")
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
                
                VStack(){
                    Text(userData.get_task(currUsername, taskName, courseName).get_task_name()).font(.title2)
                        .bold();
                    Text(userData.get_task(currUsername, taskName, courseName).get_class_name()).font(.title2)
                        .bold();
                    Text("DUE: " + userData.get_task(currUsername, taskName, courseName).get_due_date_string());
                    if (userData.get_task(currUsername, taskName, courseName).get_mark() == true)
                    {
                        Text("DONE");
                    }
                    else {
                        Text("NOT DONE");
                    }
                    
                    /*
                     @StateObject var courseData:courseDictionary = courseDictionary();
                     @StateObject var taskData:taskDictionary = taskDictionary();
                     
                     @State var prevTaskName:String;
                     @State var newTaskName:String;
                     @State var courseName:String;
                     @State var newDueDate:Date;
                     
                     */
                    HStack{
                        NavigationLink(
                            
                            destination: editTask(dataController: dataController, userData: userData, currUsername:currUsername, prevTaskName: taskName, newTaskName: taskName, courseName: courseName, newDueDate: userData.get_task(currUsername, taskName, courseName).get_due_date()),
                            
                            // destination: HomeView(currUsername: currUsername, userData: userData),
                            label: {
                                Text("Edit Task").font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                            }).frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                               LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding()
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                        Button(action: {
                            userData.delete_task(currUsername, taskName, courseName);
                            dataController.delete_task(username: currUsername, givenTaskName: taskName, givenCourseName: courseName)
                            
                        }, label:{Text("Delete Task").font(.title2)
                                .bold()
                                .foregroundColor(.white)}).frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                               LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding()
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}
