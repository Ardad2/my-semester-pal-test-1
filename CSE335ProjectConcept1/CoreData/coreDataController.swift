//
//  coreDataController.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/13/23.
//

import Foundation
import CoreData
class coreDataController : ObservableObject
{
    @Published var userCoreData:[User] = [User]()
    @Published var courseCoreData:[Course] = [Course]()
    @Published var taskCoreData:[Tasks] = [Tasks]()
    
    // Handler to persistent object container
    let persistentContainer:NSPersistentContainer
    
    /* constructor initializes the persistentContainer and load data to the three lists
       
     LanData : Programming Language Objects in Language Entity
     OSData  : Operating System objects in OS Entity
     MoData  : Mobile System objescts in the Mobile Entity
       
     */
    init()
    {
        //
        persistentContainer = NSPersistentContainer(name: "tableData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
                fatalError("cannot load data \(error.localizedDescription)")
            }
            
        }
        
        userCoreData = getUsers()
        courseCoreData = getCourses()
        taskCoreData = getTasks()

        
    }
    
    func getUsers() -> [User]
    {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let x = try persistentContainer.viewContext.fetch(fetchRequest)
            return x
        }
        catch {
            return []
        }
    }
    
    func getCourses() -> [Course]
    {
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        do {
            let x = try persistentContainer.viewContext.fetch(fetchRequest)
            return x
        }
        catch {
            return []
        }
    }
    
    func getTasks() -> [Tasks]
    {
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do {
            let x = try persistentContainer.viewContext.fetch(fetchRequest)
            return x
        }
        catch {
            return []
        }
    }
    
    //Add new user
    
    func create_new_user(username: String, password: String, email: String, firstName: String, lastName: String)
    {
        let newUser = User(context: persistentContainer.viewContext)
        
        newUser.id = UUID()
        newUser.username = username
        newUser.password = password
        newUser.email = email
        newUser.firstName = firstName
        newUser.lastName = lastName
        
        do {
            try persistentContainer.viewContext.save()
            userCoreData = getUsers()
        }
        catch {
            print("failed to save \(error)")
        }
        
        
    }
    
    func add_task(username: String, givenTaskName: String, givenClassName: String, givenDueDate: Date)
    {
        let newTask = Tasks(context: persistentContainer.viewContext)
        
        newTask.id = UUID()
        newTask.username = username
        newTask.taskName = givenTaskName
        newTask.courseName = givenClassName
        newTask.dueDate = givenDueDate
        
        do {
            try persistentContainer.viewContext.save()
            taskCoreData = getTasks()
        }
        catch {
            print("failed to save \(error)")
        }
        
    }

    func add_course(username : String, className:String, roomName:String, days:[Int], startTime:Date, endTime: Date, newLongitude: Double, newLatitude: Double)
    {
        let newCourse = Course(context: persistentContainer.viewContext)
        
        newCourse.id = UUID()
        newCourse.username = username
        newCourse.startTime = startTime
        newCourse.roomName = roomName
        newCourse.longitude = newLongitude
        newCourse.longitude = newLatitude
        newCourse.endTime = endTime
        newCourse.courseName = className
        newCourse.day0 = Int16(days[0])
        newCourse.day1 = Int16(days[1])
        newCourse.day2 = Int16(days[2])
        newCourse.day3 = Int16(days[3])
        newCourse.day4 = Int16(days[4])
        newCourse.day5 = Int16(days[5])
        newCourse.day6 = Int16(days[6])
        
        do {
            try persistentContainer.viewContext.save()
            courseCoreData = getCourses()
        }
        catch {
            print("failed to save \(error)")
        }
        
    }
    
    func delete_task(username: String, givenTaskName: String, givenCourseName: String)
    {
        //Try to find the task first
        
        for tasks in getTasks()
        {
            if ((tasks.username == username) && (tasks.taskName == givenTaskName) && (tasks.courseName == givenCourseName) )
            {
                persistentContainer.viewContext.delete(tasks)
                do {
                    //print("saving")
                    try persistentContainer.viewContext.save()
                    //LanData = getLanguages()
                } catch{
                    print("failed to save \(error)")
                }
                
                break
            }
        }
        

        

        
    }
    
    func delete_course_tasks(username: String, givenCourseName: String)
    {
        for tasks in getTasks()
        {
            if ((tasks.username == username) && (tasks.courseName == givenCourseName))
            {
                persistentContainer.viewContext.delete(tasks)
                do {
                    //print("saving")
                    try persistentContainer.viewContext.save()
                    //LanData = getLanguages()
                } catch{
                    print("failed to save \(error)")
                }
            }
        }
    }
    
    func delete_course(username: String, givenCourseName: String)
    {
        for courses in getCourses()
        {
            if ((courses.username == username) && (courses.courseName == givenCourseName))
            {
                persistentContainer.viewContext.delete(courses)
                do {
                    //print("saving")
                    try persistentContainer.viewContext.save()
                    //LanData = getLanguages()
                } catch{
                    print("failed to save \(error)")
                }
            }
        }
    }
    
    func change_profile_details(username :String, newPassword: String, newEmail: String, newFirstName: String, newLastName: String)
    {
        for users in getUsers()
        {
            if (users.username == username)
            {
                
                //First delete this user
                
                persistentContainer.viewContext.delete(users)
                do {
                    //print("saving")
                    try persistentContainer.viewContext.save()
                    //LanData = getLanguages()
                } catch{
                    print("failed to save \(error)")
                }
                
                //add the new user
                
                let newUser = User(context: persistentContainer.viewContext)
                
                newUser.id = UUID()
                newUser.username = username
                newUser.password = newPassword
                newUser.email = newEmail
                newUser.firstName = newFirstName
                newUser.lastName = newLastName
                
                do {
                    try persistentContainer.viewContext.save()
                    userCoreData = getUsers()
                }
                catch {
                    print("failed to save \(error)")
                }
                
                break;
                
            }
        }
    }
    
    
    //Edit Course
    
    func edit_course(username:String, courseName: String, newClassName:String, newRoomName:String, newDays:[Int], newStartTime:Date, newEndTime: Date, newLongitude:Double, newLatitude:Double)
    {
        
        for courses in getCourses()
        {
            if ((courses.username == username) && (courses.courseName == courseName))
            {
                //First we delete that course
                
                persistentContainer.viewContext.delete(courses)
                do {
                    //print("saving")
                    try persistentContainer.viewContext.save()
                    //LanData = getLanguages()
                } catch{
                    print("failed to save \(error)")
                }
                
                //We now replace it with the new course and add it to the courses list
                
                let newCourse = Course(context: persistentContainer.viewContext)
                
                newCourse.id = UUID()
                newCourse.username = username
                newCourse.startTime = newStartTime
                newCourse.roomName = newRoomName
                newCourse.longitude = newLongitude
                newCourse.longitude = newLatitude
                newCourse.endTime = newEndTime
                newCourse.courseName = newClassName
                newCourse.day0 = Int16(newDays[0])
                newCourse.day1 = Int16(newDays[1])
                newCourse.day2 = Int16(newDays[2])
                newCourse.day3 = Int16(newDays[3])
                newCourse.day4 = Int16(newDays[4])
                newCourse.day5 = Int16(newDays[5])
                newCourse.day6 = Int16(newDays[6])
                
                do {
                    try persistentContainer.viewContext.save()
                    courseCoreData = getCourses()
                }
                catch {
                    print("failed to save \(error)")
                }
                
                
                break;
                
            }
        }
    }
    
    func update_task_class(username: String, oldClassName: String, newClassName: String)
    {
        
    }
    
    func edit_task(username:String, givenTaskName: String, newTaskName:String, newDueDate: String)
    {
        
    }
    
    
    
}
    
