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
    
    
    
}
