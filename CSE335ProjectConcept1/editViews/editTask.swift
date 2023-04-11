//
//  editTask.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI



struct editTask: View {
    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

    
    @ObservedObject var taskData:taskDictionary = taskDictionary();
    
    @State var prevTaskName:String;
    @State var newTaskName:String;
    @State var courseName:String;
    @State var newDueDate:Date;
    @State var message:String = ""

    
    
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack {
                    NavigationLink(

                        
                        destination: HomeView(currUsername: currUsername, userData: userData),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        destination: courseDetails(userData: userData, currUsername: currUsername, courseName: self.courseName
                                                  ),
                        label: {
                            Text("Go Back to Course")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text("Editing Task \(prevTaskName)")
                    Text("\(message)")
                    HStack() {
                        Text("Task Name: ")
                        TextField("Enter the course name", text: $newTaskName)
                        
                    }
                    HStack() {
                        Text("Course: ")
                        Text("\(courseName)")
                    }
                    HStack() {
                        Text("Timings")
                        HStack() {
                            DatePicker("Due Date", selection: $newDueDate );
                            
                        }
                    }
                    VStack(){
                        
                        Button(action: {
                            
                            userData.edit_task(currUsername, prevTaskName, newTaskName, newDueDate)
                            message="Edited Task"
                        }) {
                            
                            Text("Submit")
                        }
                        
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}