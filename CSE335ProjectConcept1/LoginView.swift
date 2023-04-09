//
//  ContentView.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var enteredUsername: String = ""
    @State private var enteredPassowrd: String = ""
    
    @State var userData:userDictionary = userDictionary()
    
    var body: some View {
        NavigationStack {
            NavigationLink(
                destination: TestView(),
                label: {
                    Text("Sign In")
                }).buttonStyle(.borderedProminent)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
