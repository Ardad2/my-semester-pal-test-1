//
//  courseRecord.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation

class courseRecord: Identifiable
{
    let id = UUID()
    var className:String? = nil;
    var roomName:String? = nil;
    var days = [0, 0, 0, 0, 0, 0, 0];
    var startTime:Date? = nil;
    var endTime: Date? = nil;
    var longitude: Double
    var latitude: Double
    
    init(className:String, roomName:String, days:[Int], startTime:Date, endTime:Date, longitude: Double, latitude: Double)
    {
        self.className = className;
        self.roomName = roomName;
        self.days = days;
        self.startTime = startTime;
        self.endTime = endTime;
        self.longitude = longitude;
        self.latitude = latitude
    }
    
    //Change
    
    func change_record(newClassName:String, newRoomName:String, newDays:[Int], newStartTime:Date, newEndTime:Date, longitude: Double, latitude: Double)
    {
        self.className = newClassName;
        self.roomName = newRoomName;
        self.days = newDays;
        self.startTime = newStartTime;
        self.endTime = newEndTime;
        self.longitude = longitude
        self.latitude = latitude
    }
    
    //Get class Name
    
    func get_class_name() -> String {
        return self.className!;
    }
    
    func get_room_name() -> String {
        return self.roomName!;
    }
    
    func get_days() -> [Int] {
        return self.days;
    }
    
    func get_start_time() -> Date {
        return self.startTime!
    }
    
    func get_end_time() -> Date {
        return self.endTime!;
    }
    
    func get_start_time_string() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return (formatter.string(from: self.startTime!))
    }

    func get_end_time_string() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return (formatter.string(from: self.endTime!))
    }
    
    func get_longitude() -> Double {
        return longitude;
    }
    
    func get_latitude() -> Double {
        return latitude;
    }
    
    
    
}
