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
    
}
    
