//
//  editCourse.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.

//




import Foundation

import SwiftUI



struct editCourse: View {
    
    @State var dataController: coreDataController = coreDataController()

    
    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

    
    
    
    @State var prevCourseName:String;
    @State var newCourseName:String;
    @State var newRoomName:String;
    @State var newStartTime:Date;
    @State var newEndTime:Date;
    @State var days:[Int];
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
                        destination: MyCoursesView(dataController:dataController, userData:userData, currUsername: currUsername),
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
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                
                
                VStack(){
                    Text("Editing Course \(prevCourseName)").font(.title2)
                        .bold()
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
                        destination: newMap(dataController: dataController, userData: userData, currUsername: currUsername, prevCourseName: prevCourseName, newCourseName: newCourseName, newRoomName: newRoomName, startTime: newStartTime, endTime: newEndTime, newStartTime: newStartTime, newEndTime: newEndTime, days: days, message: message, prevLongitude: longitude, prevLatitude: latitude, isNew: false),
                        
                        label: {
                            Text("Change Location").font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }).frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)                        )
                        .cornerRadius(20)
                        .padding()
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    
                    HStack() {
                        Text("Timings")
                        HStack() {
                            DatePicker("Start Time", selection: $newStartTime, displayedComponents: .hourAndMinute);
                            DatePicker("End Time", selection: $newEndTime, displayedComponents: .hourAndMinute);
                            
                        }
                    }
                    VStack(){

                            Toggle(isOn: $onMonday)
                            {
                                Text("M")
                            }
                            Toggle(isOn: $onTuesday)
                            {
                                Text("T")
                            }
                            Toggle(isOn: $onWednesday)
                            {
                                Text("W")
                            }
                            Toggle(isOn: $onThursday)
                            {
                                Text("Th")
                            }


                            Toggle(isOn: $onFriday)
                            {
                                Text("F")
                            }
                            Toggle(isOn: $onSaturday)
                            {
                                Text("Sa")
                            }
                            Toggle(isOn: $onSunday)
                            {
                                Text("Su")
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
                        print(longitude)
                        userData.edit_course(currUsername, prevCourseName, newCourseName, newRoomName, days, newStartTime, newEndTime, longitude, latitude)
                        dataController.edit_course(username: currUsername, courseName: prevCourseName, newClassName: newCourseName, newRoomName: newRoomName, newDays: days, newStartTime: newStartTime, newEndTime: newEndTime, newLongitude: longitude, newLatitude: latitude)
                        userData.update_task_class(currUsername, prevCourseName, newCourseName)
                        dataController.update_task_class(username: currUsername, oldClassName: prevCourseName, newClassName: newCourseName)
                        message = "succesfully edited, new course is \(newCourseName)"
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
        }.navigationBarHidden(true)
    }
}

