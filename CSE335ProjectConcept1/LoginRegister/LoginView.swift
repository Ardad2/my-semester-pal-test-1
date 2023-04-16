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
    @State var loginStatus: String = ""

    
    @StateObject var userData:userDictionary = userDictionary()
    
    @State var dataController: coreDataController = coreDataController()
    
    //    func create_new_user(username: String, password: String, email:String, firstName: String, lastName: String )

    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15)
            {
                Spacer()
                Text("mySemsterPal")
                    .font(.title)
                    .bold()
            .frame(height: 20)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .padding()
                /*
                Button {
                    userData.create_new_user(username: "Arjun", password: "Arjun", email: "arjun@gmail.com", firstName: "Arjun", lastName: "Dadhwal")
                    print("created user")
    
                } label : {
                    Text("Test data")
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
                    
                    NavigationLink(destination:RegisterView(userData: userData, dataController:dataController)){

                        
                        Text("Register")                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }                    .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                           LinearGradient(colors: [.black],                   startPoint: .topLeading,                   endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding()
                    
                    
                }
                
                Spacer()

        }.navigationBarHidden(true)
        }.onAppear {userData.reset_data()
            
            var newDays: [Int]
            newDays = [0,0,0,0,0,0,0]
            
            //Intiialize the users
            
            for users in dataController.getUsers()
            {
                userData.create_new_user(username: users.username! , password: users.password!, email: users.email!, firstName: users.firstName!, lastName: users.lastName!)
            }
            
            for courses in dataController.getCourses()
            {
                newDays[0] = Int(courses.day0)
                newDays[1] = Int(courses.day1)
                newDays[2] = Int(courses.day2)
                newDays[3] = Int(courses.day3)
                newDays[4] = Int(courses.day4)
                newDays[5] = Int(courses.day5)
                newDays[6] = Int(courses.day6)
                
                
                userData.add_course(courses.username!, courses.courseName!, courses.roomName!, newDays, courses.startTime!, courses.endTime!, courses.longitude, courses.latitude)
            }
            
            for tasks in dataController.getTasks()
            {
                userData.add_task(tasks.username!, tasks.taskName!, tasks.courseName!, tasks.dueDate!)
            }
            
        }
    }
    
    @ViewBuilder
    func checkUsername() -> some View {
        switch (userData.check_login(username: enteredUsername, password: enteredPassword)) {
        case true: HomeView(dataController: dataController, currUsername: enteredUsername, userData: userData, displayEarthquakes: [], address: "Tempe", lon:-111.9400, lat: 33.4255, temp: "0");
        default: LoginView(loginStatus:"Invalid log-in details.", userData: userData, dataController:dataController)
        }
    }
}

/*struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(, displayEarthquakes: [displayEarthquake])
    }
}*/
