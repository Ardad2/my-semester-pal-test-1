//
//  userDictionary.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation

class userDictionary: ObservableObject
{
    @Published var list:[userRecord] = [userRecord]();
    
    init()
    {
        
    }
    
    //Creates the new user account.
    
    func create_new_user(username: String, password: String, email:String, firstName: String, lastName: String )
    {
        list.append(userRecord(username: username, password: password, email: email , firstName: firstName, lastName: lastName ))
    }
    
    //Checks if user exists
    
    func user_exists(givenUserName: String) -> Bool
    {
        for users in list
        {
            if (users.get_username() == givenUserName)
            {
                return true;
            }
        }
        
        return false;
    }
    
    func email_exists(givenEmail: String) -> Bool
    {
        for users in list
        {
            if (users.get_email() == givenEmail)
            {
                return true;
            }
        }
        
        return false;
    }
    
    //
    
    func check_login(username: String, password: String) -> Bool
    {
        for users in list
        {
            if (users.get_username() == username && users.get_password() == password)
            {
                return true;
            }
        }
        return false;
    }
    
    //
    
    func get_first_name(username: String) -> String
    {
        var answer = ""
        
        for users in list {
            if (users.get_username() == username)
            {
                answer = users.get_first_name();
            }
        }
        return answer
    }
    
    func get_user(username: String) -> userRecord!
    {
        for users in list {
            if (users.get_username() == username)
            {
                return users
            }
        }
        return nil;
    }
    
    
    //CourseData work
    
    //TaskData work
    
}
