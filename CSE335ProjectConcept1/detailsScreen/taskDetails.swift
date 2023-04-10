//
//  newTask.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/9/23.
//

import Foundation

import SwiftUI



struct taskDetails: View {
    var courseName:String
    var taskName:String
    
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String = ""

    
    //@ObservedObject var courseData:courseDictionary = courseDictionary();
    //@ObservedObject var taskData:taskDictionary = taskDictionary();

    
    var body: some View {
        NavigationView{
            VStack(){
                HStack {
                    NavigationLink(
                       // destination: homeScreen(courseData: courseData, taskData: taskData
                         //                      ),
                        destination: LoginView(),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text(userData.get_user(username: currUsername).taskData.get_task(taskName, courseName).get_task_name());
                    Text(userData.get_user(username: currUsername).taskData.get_task(taskName, courseName).get_class_name());
                    Text("DUE: " + userData.get_user(username: currUsername).taskData.get_task(taskName, courseName).get_due_date_string());
                    if (userData.get_user(username: currUsername).taskData.get_task(taskName, courseName).get_mark() == true)
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
                    
                    NavigationLink(
                        //destination: editTask(courseData: courseData, taskData: taskData, prevTaskName: taskName, newTaskName: taskName, courseName: courseName, newDueDate: taskData.get_task(taskName, courseName).get_due_date()),
                        destination: HomeView(),
                        label: {
                            Text("Edit Task")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    Button(action: {
                        userData.get_user(username: currUsername).taskData.delete_task(taskName, courseName);
                        
                    }, label:{Text("Delete Task")})
                }
            }
        }.navigationBarHidden(true)
    }
}
