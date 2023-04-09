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
    @State private var loginStatus: String = ""
    
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
                
                Text("\(loginStatus)");

                HStack {
                    /*
                    Button {
                        if (enteredUsername == "Arjun")
                        {
                            //loginStatus="Succesfully logged in!"
                            TestView()
                        }
                        else {
                            loginStatus = "The account \(enteredUsername) does not exist!"
                        }
                    } label : {
                        Text("Sign in")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                       LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                    )
                    .cornerRadius(20)
                    .padding()
                     */
                    
                    NavigationLink(destination:checkUsername()){
                        Text("Sign in")                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }                    .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                    
                    
                    Button {

        
                        loginStatus = "Cannot register new accounts!"
                    } label : {
                        Text("Register")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                       LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                    )
                    .cornerRadius(20)
                    .padding()
                }
                
                Spacer()

        }
        }
    }
    
    @ViewBuilder
    func checkUsername() -> some View {
        switch enteredUsername {
        case "Arjun": TestView()
        default: LoginView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
