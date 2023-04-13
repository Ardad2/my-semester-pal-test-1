//
//  editUser.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/13/23.
//

import Foundation

import SwiftUI

struct editUser: View {
    
    @ObservedObject var userData:userDictionary = userDictionary()
    @State var currUsername: String
    
    @State var newFirstName:String
    @State var newLastName:String
    @State var newEmail:String
    @State var newPassword1:String
    @State var newPassword2:String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15)
            {
                Spacer()
                
                Text("Editing Profile for \(currUsername)")                        .font(.title)
                    .bold()
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .padding()
                
                
            }
        }
    }
}
