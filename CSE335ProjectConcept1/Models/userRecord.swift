//
//  userRecord.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation

class userRecord: Identifiable
{
    let id = UUID()
    var username:String? = nil;
    var password:String? = nil;
    var email:String? = nil;
    var firstName:String? = nil;
    var lastName: String? = nil;
    
    var courseData:courseDictionary = courseDictionary()
    var taskData:taskDictionary = taskDictionary()
    
    init(username:String, password:String, email:String, firstName:String, lastName:String)
    {
        self.username = username;
        self.password = password;
        self.email = email;
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    func change_password(newPassword: String)
    {
        self.password = newPassword;
    }
    
    func change_email(newEmail: String)
    {
        self.email = newEmail;
    }
    
    func change_name(newFirstName: String, newLastName: String)
    {
        self.firstName = newFirstName;
        self.lastName = newLastName;
    }
    
    //Functions for the user
    
    func get_username() -> String
    {
        return self.username!
    }
    
    func get_email() -> String
    {
        return self.email!
    }
    
    //Functions for the Course Data
    
    func add_course( _ className:String, _ roomName:String, _ days:[Int], _ startTime:Date, _ endTime: Date)
    {
        self.courseData.add_course(className, roomName, days, startTime, endTime)
    }
    
    func get_course(_ givenCourseName: String) -> courseRecord
    {
        return self.courseData.get_course(givenCourseName)
    }
    
    func edit_course( _ courseName:String, _ newClassName:String, _ newRoomName:String, _ newDays:[Int], _ newStartTime:Date, _ newEndTime:Date)
    {
        self.courseData.edit_course(courseName, newClassName, newRoomName, newDays, newStartTime, newEndTime)
    }
    
    func delete_course(_ givenCourseName:String)
    {
        self.courseData.delete_course(givenCourseName)
    }
    
    //Functions for the Task Data
    
    func add_task( _ givenTaskName:String, _ givenClassName:String, _ givenDueDate: Date)
    {
        self.taskData.add_task(givenTaskName, givenClassName, givenDueDate);
    }

    func get_task(_ givenTaskName:String, _ givenCourseName:String) -> taskRecord
    {
        self.taskData.get_task(givenTaskName, givenCourseName)
    }

    func update_task_class(_ oldClassName:String, _ newClassName:String)
    {
        self.taskData.update_task_class(oldClassName, newClassName)
    }

    func edit_task( _ givenTaskName:String, _ newTaskName:String, _ newDueDate:Date)
    {
        self.taskData.edit_task(givenTaskName, newTaskName, newDueDate);
    }
    func delete_task(_ givenTaskName: String, _ givenCourseName: String)
    {
        self.taskData.delete_task(givenTaskName, givenCourseName)
    }

    func delete_course_tasks(_ givenCourseName: String)
    {
        self.taskData.delete_course_tasks(givenCourseName);
    }
    
    
    
}
