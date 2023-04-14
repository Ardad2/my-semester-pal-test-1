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
    
    

    
}
    
