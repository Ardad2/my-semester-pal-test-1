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
    
    func get_user(_ username: String) -> userRecord!
    {
        for users in list {
            if (users.get_username() == username)
            {
                return users
            }
        }
        return nil;
    }
    
    
    //Course and Task Data work
    
    
    func add_course(_ username: String,  _ className:String, _ roomName:String, _ days:[Int], _ startTime:Date, _ endTime: Date)
    {
        
        for users in list {
            if (users.get_username() == username)
            {
                users.add_course(className, roomName, days, startTime, endTime)
            }
        }
        
        //self.courseData.add_course(className, roomName, days, startTime, endTime)
    }
    
    func get_course(_ username: String, _ givenCourseName: String) -> courseRecord
    {
        
        for users in list {
            if (users.get_username() == username)
            {
                return users.get_course(givenCourseName)
            }
        }
        
        return list[0].get_course(givenCourseName)
    }
    
    func edit_course(_ username:String, _ courseName:String, _ newClassName:String, _ newRoomName:String, _ newDays:[Int], _ newStartTime:Date, _ newEndTime:Date)
    {
        
        for users in list {
            if (users.get_username() == username)
            {
                users.edit_course(courseName, newClassName, newRoomName, newDays, newStartTime, newEndTime)
            }
        }
        
        return list[0].edit_course(courseName, newClassName, newRoomName, newDays, newStartTime, newEndTime)
    }
    
    func delete_course(_ username:String, _ givenCourseName:String)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.delete_course(givenCourseName)
            }
        }
        
        return list[0].delete_course(givenCourseName)
    }
    
    
    func add_task(_ username: String, _ givenTaskName:String, _ givenClassName:String, _ givenDueDate: Date)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.add_task(givenTaskName, givenClassName, givenDueDate)
            }
        }
        
    }

    func get_task(_ username: String, _ givenTaskName:String, _ givenCourseName:String) -> taskRecord
    {
        for users in list {
            if (users.get_username() == username)
            {
                return users.get_task(givenTaskName, givenCourseName)
            }
        }
        return list[0].get_task(givenTaskName, givenCourseName)
    }

    func update_task_class(_ username: String, _ oldClassName:String, _ newClassName:String)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.update_task_class(oldClassName, newClassName)
            }
        }
    }

    func edit_task(_ username: String, _ givenTaskName:String, _ newTaskName:String, _ newDueDate:Date)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.edit_task(givenTaskName, newTaskName, newDueDate)
            }
        }
    }
    func delete_task(_ username: String, _ givenTaskName: String, _ givenCourseName: String)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.delete_task(givenTaskName, givenCourseName)
            }
        }
    }

    func delete_course_tasks(_ username: String, _ givenCourseName: String)
    {
        for users in list {
            if (users.get_username() == username)
            {
                users.delete_course_tasks(givenCourseName)
            }
        }
    }
    
    
    
 
    
}
