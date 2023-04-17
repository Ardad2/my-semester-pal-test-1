//
//  newCourse.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import MapKit
import SwiftUI


struct newCourse: View {
    
    @State var dataController: coreDataController = coreDataController()

    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String
    
    @ObservedObject var courseData:courseDictionary = courseDictionary();
    @ObservedObject var taskData:taskDictionary = taskDictionary();
    
    @State var newCourseName:String = ""
    @State var newRoomName:String = ""
    @State var startTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var endTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var days = [0,0,0,0,0,0,0]
    @State var message:String = ""
    @State var longitude: Double = 0.0
    @State var latitude: Double = 0.0
    
    @State private var isOn = false
    @State private var onMonday = false;
    @State private var onTuesday = false;
    @State private var onWednesday = false;
    @State private var onThursday = false;
    @State private var onFriday = false;
    @State private var onSaturday = false;
    @State private var onSunday = false;

    

    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15){
                HStack {
                    NavigationLink(
                        destination: HomeView(dataController:dataController, currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),
                        
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    NavigationLink(
                        /* destination: myCourses(courseData: courseData, taskData: taskData
                         ),*/
                        destination: MyCoursesView(dataController: dataController, userData: userData, currUsername: currUsername),
                        label: {
                            Text("Go Back to Courses")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                }
                VStack(){
                    Text("Creating New Course")
                    Text("\(message)")
                    
                    HStack() {
                        Text("Course Name: ")
                        TextField("Enter the course name", text: $newCourseName)
                        
                    }
                    HStack() {
                        Text("Course Location Name: ")
                        TextField("Enter the course name", text: $newRoomName)
                    }
                    
                    HStack() {
                        Text("Longitude/Latitude: ")
                       Text("\(longitude),\(latitude)")
                    }
                    
                    NavigationLink(
                        destination: newMap(dataController: dataController, userData: userData, currUsername: currUsername, prevCourseName: "", newCourseName: newCourseName, newRoomName: newRoomName, startTime: startTime, endTime: endTime, newStartTime: startTime, newEndTime: endTime, days: days, message: message, prevLongitude: longitude, prevLatitude: latitude, isNew: true),
                        
                        label: {
                            Text("Change Location")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                    
                    HStack() {
                        VStack {

                                VStack{
                                    DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute);
                                }
                                VStack {
                                    DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute);
                                }
                                

                        }
                    }
                    VStack(){
                            Toggle(isOn: $onMonday)
                            {
                                Text("Monday")
                            }
                        
                            Toggle(isOn: $onTuesday)
                            {
                                Text("Tuesday")
                            }
                            Toggle(isOn: $onWednesday)
                            {
                                Text("Wednesday")
                            }
                            Toggle(isOn: $onThursday)
                            {
                                Text("Thursday")
                            }
                            Toggle(isOn: $onFriday)
                            {
                                Text("Friday")
                            }
                            Toggle(isOn: $onSaturday)
                            {
                                Text("Saturday")
                            }
                            Toggle(isOn: $onSunday)
                            {
                                Text("Sunday")
                            }
                            
                    }
                    
                    Button(action: {
                        if (onMonday)
                        {
                            days[0] = 1;
                        }
                        if (onTuesday)
                        {
                            days[1] = 1;
                        }
                        if (onWednesday)
                        {
                            days[2] = 1;
                        }
                        if (onThursday)
                        {
                            days[3] = 1;
                        }
                        if (onFriday)
                        {
                            days[4] = 1;
                        }
                        if (onSaturday)
                        {
                            days[5] = 1;
                        }
                        if (onSunday)
                        {
                            days[6] = 1;
                        }
                        
                        userData.add_course(currUsername, newCourseName, newRoomName, days, startTime, endTime, longitude, latitude)
                        
                        
                        
                        dataController.add_course(username: currUsername, className: newCourseName, roomName: newRoomName, days: days, startTime: startTime, endTime: endTime, newLongitude: longitude, newLatitude: latitude)
                        
                        message = "Succesfully added Course \(newCourseName)"
                    }) {
                        Text("Submit")
                    }.frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                    
                }
            }
        }.navigationBarHidden(true)
    }
}

