//
//  courseDetails.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI



struct courseDetails: View {
    
    
    @State var dataController: coreDataController = coreDataController()

    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

    
    var courseName:String
    
    var body: some View {
        NavigationView {
            VStack(){
                /*
                HStack {
                    NavigationLink(
                       /* destination: homeScreen(courseData: courseData, taskData: taskData
                                               ),*/
                        
                        destination: HomeView(dataController: dataController, currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),

                        
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        /*destination: myCourses(courseData: courseData, taskData: taskData
                                              ),*/
                        
                        destination: MyCoursesView(dataController: dataController, userData: userData, currUsername: currUsername),

                        label: {
                            Text("Back")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                */
                
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
                        destination: MyCoursesView(dataController: dataController, userData: userData, currUsername: currUsername),
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
                
                
                
                
                
                
                VStack(){
                    Text(userData.get_course(currUsername, courseName).get_class_name()).font(.title2)
                        .bold();
                    Text(userData.get_course(currUsername, courseName).get_room_name()).font(.title3);
                    Text(String(userData.get_course(currUsername, courseName).get_longitude()));
                    Text(String(userData.get_course(currUsername, courseName).get_latitude()));
                    
                    
                    HStack(alignment:.center) {
                            var days = userData.get_course(currUsername, courseName).get_days();
                            if (days[0] == 1)
                            {
                                Text("M ")
                            }
                            if (days[1] == 1)
                            {
                                Text("Tu ")
                            }
                            if (days[2] == 1)
                            {
                                Text("W ")
                            }
                            if (days[3] == 1)
                            {
                                Text("Th ")
                            }
                            if (days[4] == 1)
                            {
                                Text("F ")
                            }
                            if (days[5] == 1)
                            {
                                Text("Sa ")
                            }
                            if (days[6] == 1)
                            {
                                Text("Su ")
                            }

                        Text(userData.get_course(currUsername, courseName).get_start_time_string() + " to " + userData.get_course(currUsername, courseName).get_end_time_string());

                        Spacer();
                    }
                    
                    
                    HStack(){
                        NavigationLink(
                            destination: editCourse(dataController: dataController, userData: userData, currUsername: currUsername, prevCourseName: courseName, newCourseName: courseName, newRoomName: userData.get_course(currUsername, courseName).get_room_name(), newStartTime: userData.get_course(currUsername, courseName).get_start_time(), newEndTime: userData.get_course(currUsername, courseName).get_end_time(), days: userData.get_course(currUsername, courseName).get_days() ),
                            

                            
                            label: {
                                Text("Edit Course").font(.title2)
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
                        
                        Button(action: {
                            userData.delete_course_tasks(currUsername, courseName);
                            dataController.delete_course_tasks(username: currUsername, givenCourseName: courseName)
                            userData.delete_course(currUsername, courseName);
                            dataController.delete_course(username: currUsername, givenCourseName: courseName)
                            
                        }, label:{Text("Delete Course").font(.title2)
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
                    
                    //
                    
                    
                    //
                    NavigationLink(
                        destination: newTask(dataController: dataController, userData: userData, currUsername: currUsername, courseName: self.courseName),

                        label: {
                            Text("Add New Task").font(.title2)
                                .bold()
                                .foregroundColor(.white)
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
                                            destination: taskDetails(dataController: dataController, userData: userData, currUsername: currUsername, courseName: courseName, taskName:datum.get_task_name())
                                            //destination: HomeView(currUsername: currUsername, userData: userData)

                                        
                                        ){
                                            VStack()
                                            {
                                                HStack {
                                                    if (datum.get_mark() == false)
                                                    {
                                                        Image(systemName: "circle")
                                                    }
                                                    else {
                                                        Image(systemName: "checkmark.circle.fill")
                                                    }
                                                    Text(datum.get_task_name());
                                                    Text(datum.get_class_name());
                                                    Text(datum.get_due_date_string())
                                                    Spacer();                                                }
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }.listStyle(PlainListStyle())
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
