//
//  myCourses.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/9/23.
//

import Foundation

import SwiftUI

struct myCourses: View {
    @State private var enteredUsername: String = ""
    @State private var enteredPassword: String = ""
        
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String = ""

    
    var body: some View {
        NavigationView {


        VStack {
            HStack {
                NavigationLink(
                    //destination: homeScreen(courseData: courseData, taskData: taskData
                    //),
                    destination: LoginView(),
                    label: {
                        Text("Home")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)

            }
            
            /*
             
             @StateObject var courseData:courseDictionary = courseDictionary();
             @StateObject var taskData:taskDictionary = taskDictionary();
             
             @State var newCourseName:String = ""
             @State var newRoomName:String = ""
             @State var startTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
             @State var endTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
             @State var days = [0,0,0,0,0,0,0]
             
             */
            VStack {
                Text("My Courses")
                NavigationLink(
                    //destination: newCourse(courseData: courseData, taskData: taskData),
                    destination: LoginView(),
                    label: {
                        Text("Add a New Course")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)

                    VStack {
                        
                        List {
                            Section(header: ListHeader1())
                            {
                                ForEach(userData.get_user(username: currUsername).courseData.list)
                                {
                                   /* datum in NavigationLink(destination: courseDetails(courseName: datum.get_class_name(), courseData: courseData, taskData: taskData))*/
                                    
                                    datum in NavigationLink(destination: LoginView())
                                    
                                    {VStack()
                                    {
                                        HStack {
                                            Text(datum.get_class_name());
                                            Text(datum.get_room_name());
                                            Text(datum.get_start_time_string() + " to " + datum.get_end_time_string());
                                            HStack{
                                                var days = datum.get_days();
                                                if (days[0] == 1)
                                                {
                                                    Text("M")
                                                }
                                                if (days[1] == 1)
                                                {
                                                    Text("T")
                                                }
                                                if (days[2] == 1)
                                                {
                                                    Text("W")
                                                }
                                                if (days[3] == 1)
                                                {
                                                    Text("Th")
                                                }
                                                if (days[4] == 1)
                                                {
                                                    Text("F")
                                                }
                                                if (days[5] == 1)
                                                {
                                                    Text("Sa")
                                                }
                                                if (days[6] == 1)
                                                {
                                                    Text("Su")
                                                }
                                            }
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
    }.navigationBarHidden(true)

    }
}

struct myCourses_Previews: PreviewProvider {
    static var previews: some View {
        myCourses()
    }
}

struct ListHeader1: View {
    var body: some View {
        HStack {
            Text("COURSE LIST ")
        }
    }
}

