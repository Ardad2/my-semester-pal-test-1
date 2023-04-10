//
//  myCourses.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI

struct MyCoursesView: View {
    
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(
                        destination: HomeView(currUsername: currUsername, userData: userData),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)

                }
                
                VStack {
                    Text("My Courses")
                    NavigationLink(
                        destination: HomeView(currUsername: currUsername, userData: userData),
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
                                ForEach(userData.get_user(username:currUsername).courseData.list)
                                {
                                    datum in NavigationLink(destination: HomeView(currUsername: currUsername, userData: userData))
                                    {
                                        HStack {
                                            Text(datum.get_class_name());
                                            Text(datum.get_room_name());
                                            Text(datum.get_start_time_string() + " to " + datum.get_end_time_string());
                                            HStack {
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
                                            Spacer()
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
    struct ListHeader1: View {
        var body: some View {
            HStack {
                Text("COURSE LIST ")
            }
        }
    }

}
