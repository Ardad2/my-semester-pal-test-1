//
//  ContentView.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

/*
 
 NavigationLink(
     destination: TestView(),
     label: {
         Text("Sign In")
     }).buttonStyle(.borderedProminent)
     .navigationTitle("Home")
     .navigationBarTitleDisplayMode(.inline)
     .navigationBarHidden(true)

 */

import SwiftUI

struct LoginView: View {
    
    @State private var enteredUsername: String = ""
    @State private var enteredPassword: String = ""
    @State private var showPassword: Bool = false
    
    @State var userData:userDictionary = userDictionary()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15)
            {
                Spacer()
                TextField("Enter username", text: $enteredUsername).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                
                HStack{
                    Group {
                        if showPassword {
                            TextField("Enter your password", text:$enteredPassword)
                        }
                        else {
                            SecureField("Password", text: $enteredPassword)
                        }
                        
                    }.padding(10) .overlay { RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)}
                }.padding(.horizontal)

                
                Spacer()

        }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
