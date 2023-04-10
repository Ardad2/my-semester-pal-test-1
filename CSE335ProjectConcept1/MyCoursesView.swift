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
                        destination: homeScreen(courseData: courseData, taskData: taskData
                        ),
                        label: {
                            Text("Home")
                        }).buttonStyle(.borderedProminent)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)

                }
                
                
                
            }
        }
    }
}
