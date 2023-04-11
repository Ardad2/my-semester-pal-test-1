//
//  courseDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI

struct courseDetails: View {
    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String
    
    var courseName:String
    
    var body: some View {
        NavigationView {
            VStack(){
                HStack {
                    NavigationLink(
                       /* destination: homeScreen(courseData: courseData, taskData: taskData
                                               ),*/
                        
                        destination: HomeView(currUsername: currUsername, userData: userData),
                        
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        /*destination: myCourses(courseData: courseData, taskData: taskData
                                              ),*/
                        
                        destination: HomeView(currUsername: currUsername, userData: userData),

                        label: {
                            Text("Back")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text(userData.get_course(currUsername, courseName).get_class_name());
                    Text(userData.get_course(currUsername, courseName).get_room_name());
                    
                    HStack {
                        Text(userData.get_course(currUsername, courseName).get_start_time_string() + " to " + userData.get_course(currUsername, courseName).get_end_time_string());
                        HStack{
                            var days = userData.get_course(currUsername, courseName).get_days();
                            if (days[0] == 1)
                            {
                                Text("Monday ")
                            }
                            if (days[1] == 1)
                            {
                                Text("Tuesday ")
                            }
                            if (days[2] == 1)
                            {
                                Text("Wednesday ")
                            }
                            if (days[3] == 1)
                            {
                                Text("Thursday ")
                            }
                            if (days[4] == 1)
                            {
                                Text("Friday ")
                            }
                            if (days[5] == 1)
                            {
                                Text("Saturday ")
                            }
                            if (days[6] == 1)
                            {
                                Text("Sunday ")
                            }
                        }
                        Spacer();
                    }
                    
                    
                    HStack(){
                        NavigationLink(
                            /*destination: editCourse(courseData: courseData, taskData: taskData, prevCourseName: courseName, newCourseName: courseName, newRoomName: courseData.get_course(courseName).get_room_name(), newStartTime: courseData.get_course(courseName).get_start_time(), newEndTime: courseData.get_course(courseName).get_end_time(), days: courseData.get_course(courseName).get_days() ),*/
                            
                            destination: HomeView(currUsername: currUsername, userData: userData),

                            
                            label: {
                                Text("Edit Course")
                            }).buttonStyle(.borderedProminent)
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                        
                        Button(action: {
                            userData.delete_course_tasks(currUsername, courseName);
                            userData.delete_course(currUsername, courseName);
                            
                        }, label:{Text("Delete Course")})
                        
                    }
                    
                    //
                    
                    
                    //
                    NavigationLink(
                        /*destination: newTask(courseData: courseData, taskData: taskData, courseName: self.courseName),*/
                        destination: HomeView(currUsername: currUsername, userData: userData),

                        label: {
                            Text("Add New Task")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                    List {
                        Section(header: ListHeader2())
                        {
                            ForEach(userData.get_user(currUsername).taskData.list)
                            {
                                datum in
                                Group{
                                    if (datum.get_class_name() == courseName) {
                                        NavigationLink(
                                           /* destination: taskDetails(courseName: courseName, taskName:datum.get_task_name(), courseData: courseData, taskData: taskData)*/
                                            destination: HomeView(currUsername: currUsername, userData: userData)

                                        
                                        ){
                                            VStack()
                                            {
                                                HStack {
                                                    Text(datum.get_task_name());
                                                    Spacer();
                                                }
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
    }
    
}

struct ListHeader2: View {
    var body: some View {
        HStack {
            Text("TASK LIST ")
        }
    }
}
