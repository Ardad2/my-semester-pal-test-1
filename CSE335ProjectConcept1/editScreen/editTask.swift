//
//  editTask.swift
//  CSE335Project1Phase1
//
//  Created by Arjun Dadhwal on 3/18/23.
//

import Foundation

import SwiftUI



struct editTask: View {
    
    
    
    @ObservedObject var courseData:courseDictionary = courseDictionary();
    @ObservedObject var taskData:taskDictionary = taskDictionary();
    
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String = ""
    
    
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
                        //destination: homeScreen(courseData: courseData, taskData: taskData
                        destination: LoginView(),
                                               //),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        //destination: courseDetails(courseName: self.courseName, courseData: courseData, taskData: taskData
                          //                        ),
                        destination: LoginView(),
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
                            
                            userData.get_user(username: currUsername).taskData.edit_task(prevTaskName, newTaskName, newDueDate)
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
