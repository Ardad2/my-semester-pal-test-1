//
//  taskRecord.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation

class taskRecord: Identifiable
{
    let id = UUID()
    
    var mark:Bool
    var taskName:String? = nil;
    var className:String? = nil;
    var dueDate:Date? = nil;

    init(taskName:String, className:String, dueDate:Date)
    {
        self.mark = false;
        self.taskName = taskName;
        self.className = className;
        self.dueDate = dueDate;
    }
    
    func change_task(newTaskName:String, newDueDate:Date)
    {
        self.taskName = newTaskName;
        self.dueDate = newDueDate;
    }
    
    func change_task_class(newClassName:String)
    {
        self.className = newClassName;
    }
    func toggle_mark()
    {
        if (self.mark == false)
        {
            self.mark = true;
        }
        else {
            self.mark = false;
        }
    }
    
    func get_mark() -> Bool
    {
        return self.mark;
    }
    
    func get_task_name() -> String
    {
        return self.taskName!
    }
    
    func get_class_name() -> String
    {
        return self.className!
    }
    
    func get_due_date() -> Date
    {
        return self.dueDate!;
    }
    
    func get_due_date_string() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return (formatter.string(from: self.dueDate!))

    }
    

    
    //Mark, Task Name, courseName, dueDate, duetime,
    
}

