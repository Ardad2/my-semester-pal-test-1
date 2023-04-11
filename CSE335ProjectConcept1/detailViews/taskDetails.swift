//
//  taskDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI

struct taskDetails: View {
    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String



    var courseName:String
    var taskName:String
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack {
                    NavigationLink(
                        /*destination: homeScreen(courseData: courseData, taskData: taskData
                                               ),*/
                        destination: HomeView(currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon: -111.9400, lat: 33.4255 ),

                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text(userData.get_task(currUsername, taskName, courseName).get_task_name());
                    Text(userData.get_task(currUsername, taskName, courseName).get_class_name());
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
                    
                    NavigationLink(
                        
                        destination: editTask(userData: userData, currUsername:currUsername, prevTaskName: taskName, newTaskName: taskName, courseName: courseName, newDueDate: userData.get_task(currUsername, taskName, courseName).get_due_date()),
                        
                       // destination: HomeView(currUsername: currUsername, userData: userData),
                        label: {
                            Text("Edit Task")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    Button(action: {
                        userData.delete_task(currUsername, taskName, courseName);
                        
                    }, label:{Text("Delete Task")})
                }
            }
        }.navigationBarHidden(true)
    }
}
