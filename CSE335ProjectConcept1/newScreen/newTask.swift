//
//  newTask.swift
//  CSE335Project1Phase1
//
//  Created by Arjun Dadhwal on 3/18/23.
//

import Foundation

import SwiftUI



struct newTask: View {
    
    
    
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String = ""
    

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
                        //destination: homeScreen(courseData: courseData, taskData: taskData
                          //                     ),
                        destination: LoginView(),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        //destination: courseDetails(courseName: courseName, courseData: courseData, taskData: taskData
                          //                        ),
                        destination:LoginView(),
                        label: {
                            Text("Go Back to Course")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text("Create New Task")
                    Text("\(message)")
                    
                    HStack() {
                        Text("Task Name: ")
                        TextField("Enter the task name", text: $newTaskName)
                        
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
                            
                            userData.get_user(username: currUsername).taskData.add_task(newTaskName, courseName, newDueDate)
                            message = "Succesfully added task \(newTaskName)"
                        }) {
                            
                            Text("Submit")
                        }
                        
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}
