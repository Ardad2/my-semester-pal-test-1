//
//  taskDictionary.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation



class taskDictionary: ObservableObject
{
    @Published var list:[taskRecord] = [taskRecord]();
    let calendar = Calendar.current
    
    init() {
        
    }
    
    /*
     var mark:Bool
     var taskName:String
     var className:String
     var dueDate:Date;
     var dueTime:Int;
     */
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: date1, to: date2)
        if diff.day == 0 {
            return true
        } else {
            return false
        }
    }
    
    //ADD A COURSE
    
    func add_task( _ givenTaskName:String, _ givenClassName:String, _ givenDueDate: Date)
    {
        list.append(taskRecord(taskName: givenTaskName, className: givenClassName, dueDate: givenDueDate))
        
        //let list = list.sorted(by: {{lhs, rhs} in if lhs.dueDate == rhs.dueDate})
        
        list = list.sorted { (lhs, rhs) in
            return lhs.get_due_date() < rhs.get_due_date()
        }
    }
    func get_task(_ givenTaskName:String, _ givenCourseName:String) -> taskRecord
    {
        for tasks in list
        {
            if ( (tasks.get_class_name() == givenCourseName) && (tasks.get_task_name() == givenTaskName) )
            {
                return tasks;
            }
        }
        return taskRecord(taskName: "F", className: "F", dueDate: Calendar.current.date(byAdding: .hour, value: +1, to: Date())!);
    }
    
    func update_task_class(_ oldClassName:String, _ newClassName:String)
    {
        for tasks in list
        {
            if (tasks.get_class_name() == oldClassName)
            {
                tasks.change_task_class(newClassName: newClassName);
            }
        }
        list = list.sorted { (lhs, rhs) in
            return lhs.get_due_date() < rhs.get_due_date()
        }
    }
    
    func edit_task( _ givenTaskName:String, _ newTaskName:String, _ newDueDate:Date)
    {
        for task in list
        {
            if (task.get_task_name() == givenTaskName)
            {
                task.change_task(newTaskName:newTaskName, newDueDate: newDueDate)
            }
        }
        list = list.sorted { (lhs, rhs) in
            return lhs.get_due_date() < rhs.get_due_date()
        }
    }
    
    func delete_task(_ givenTaskName: String, _ givenCourseName: String)
    {
         list = list.filter {($0.get_class_name() != givenCourseName || ($0.get_task_name() != givenTaskName) )}
        
        
    }
    
    func delete_course_tasks(_ givenCourseName: String)
    {
        print("Deleted Course tasks!")
         list = list.filter {($0.get_class_name() != givenCourseName)}
    }

}


