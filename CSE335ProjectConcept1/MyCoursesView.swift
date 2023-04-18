//
//  myCourses.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/10/23.
//

import Foundation

import SwiftUI

struct MyCoursesView: View {
    
    @State var dataController: coreDataController = coreDataController()

    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    NavigationLink(
                        destination: HomeView(dataController: dataController, currUsername: currUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0"),

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
                    


                }            .padding()
                    .background(Color.black)
                    .frame(height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

                
                VStack {
                    Text("My Courses")
                        .font(.title)
                        .bold()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding()
                    NavigationLink(
                        destination: newCourse(dataController: dataController, userData: userData, currUsername: currUsername),
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
                                ForEach(userData.get_user(currUsername).courseData.list)
                                {
                                    datum in NavigationLink(destination: courseDetails(dataController: dataController, userData:userData, currUsername: currUsername, courseName: datum.get_class_name()))
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
                        }                    .listStyle(PlainListStyle())

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
