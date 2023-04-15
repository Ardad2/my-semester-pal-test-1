//
//  RegisterView.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/8/23.
//

import Foundation

import SwiftUI

struct RegisterView: View {
    
    @State private var enteredUsername: String = ""
    @State private var enteredEmail: String = ""
    @State private var enteredPassword: String = ""
    @State private var enteredFirstName: String = ""
    @State private var enteredLastName: String = ""
    @State private var registerStatus: String = ""

    
    @State private var showPassword: Bool = false
    
    @StateObject var userData:userDictionary = userDictionary()
    
    @State var dataController: coreDataController = coreDataController()

    
    //    func create_new_user(username: String, password: String, email:String, firstName: String, lastName: String )

    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15)
            {
                Spacer()

                    Text("Create an Account")
                        .font(.title)
                        .bold()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding()
                
                Text("\(registerStatus)")
                
                TextField("Enter username", text: $enteredUsername).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                TextField("Enter email addres", text: $enteredEmail).padding(10).overlay {
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
                
                TextField("Enter First Name", text: $enteredFirstName).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)
                TextField("Enter your Last Name", text: $enteredLastName).padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10) .stroke(.black, lineWidth: 2)
                }.padding(.horizontal)

            VStack {
                Button(action:
                        
                        {
                    if (userData.user_exists(givenUserName: enteredUsername))
                    {
                        registerStatus = "An account with that username already exists!"
                    }
                    else if (userData.email_exists(givenEmail: enteredEmail))
                    {
                        registerStatus = "An account with that email already exists!"
                    }
                    else
                    {
                        userData.create_new_user(username:enteredUsername, password: enteredPassword, email: enteredEmail, firstName: enteredFirstName, lastName: enteredLastName)
                        registerStatus = "Succesfully created account \(enteredUsername)!"
                    }
                }
                
                ){

                        
                        Text("Sign Up")                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }                    .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                
                NavigationLink(destination:LoginView(userData:userData)){

                    
                    Text("Already have an account? Sign in")
                        .foregroundColor(.black)
                }                    .frame(height: 50)
                    .frame(maxWidth: .infinity)

                    
                    /*
                    
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
                     */
                }
                
                Spacer()

        }.navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    func checkUsername() -> some View {
        switch (userData.check_login(username: enteredUsername, password: enteredPassword)) {
        case true: HomeView(displayEarthquakes: [], address: "Tempe", lon: 32, lat: -100, temp: "0")

        default: RegisterView(userData: userData)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

