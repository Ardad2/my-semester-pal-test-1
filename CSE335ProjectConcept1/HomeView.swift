//
//  TestView.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State var currUsername: String = ""
    @StateObject var userData:userDictionary = userDictionary()

    var body: some View {
        VStack {
            HStack {
                NavigationLink(
                    destination: LoginView(userData: userData),
                    label: {
                        Text("\(currUsername)")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: MyCoursesView(userData:userData, currUsername: currUsername),
                    label: {
                        Text("My Courses")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: LoginView(),
                    label: {
                        Text("Settings")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
            
            VStack {
                VStack {
                    Text("Welcome back \(userData.get_first_name(username: currUsername)) !")
                    List {
                        Section(header: ListHeader())
                        {
                            ForEach(userData.get_user(currUsername).taskData.list)
                            {
                                datum in NavigationLink(destination: taskDetails(userData:userData, currUsername: currUsername, courseName: datum.get_class_name(), taskName: datum.get_task_name())){VStack()
                                {
                                    HStack {
                                        Text(datum.get_task_name());
                                        Text(datum.get_class_name());
                                        Text(datum.get_due_date_string())
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
        .padding()
    }
    
    struct ListHeader: View {
        var body: some View {
            HStack {
                Text("TASK LIST ")
            }
        }
    }

}

