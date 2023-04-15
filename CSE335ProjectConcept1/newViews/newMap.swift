//
//  newMap.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/12/23.
//

import Foundation

import MapKit
import SwiftUI

struct Location1: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}

struct newMap: View {
    @State var dataController: coreDataController = coreDataController()
    @ObservedObject var userData:userDictionary = userDictionary();
    @State var currUsername: String

    @State var prevCourseName:String;
    @State var newCourseName:String = ""
    @State var newRoomName:String = ""
    @State var startTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var endTime:Date = Calendar.current.date(byAdding: .hour, value: +1, to: Date())!
    @State var newStartTime:Date;
    @State var newEndTime:Date;
    @State var days = [0,0,0,0,0,0,0]
    @State var message:String = ""
    @State var prevLongitude: Double = 0.0
    @State var prevLatitude: Double = 0.0
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.4242, longitude: -111.9281), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location1]()
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State var isNew = true
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) {
                location in MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }.ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height : 32)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button{
                        //create a new location
                        
                        let newLocation = Location1(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        
                        latitude = mapRegion.center.latitude
                        longitude = mapRegion.center.longitude
                        
                        locations.removeAll()
                        locations.append(newLocation)
                    } label : {
                        Image(systemName: "plus")
                    }
                    
                    
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    
                    NavigationLink(destination:returnView()){

                        
                        Text("Go back")                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }                    .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    
                }
                
            }
            
        }
    }
    
    @ViewBuilder
    func returnView() -> some View {
        switch (isNew) {
        case true: newCourse(userData: userData, currUsername: currUsername, newCourseName: newCourseName, newRoomName: newRoomName, startTime: startTime, endTime: endTime, days: days, longitude: longitude, latitude: latitude);
        default: editCourse(userData: userData, currUsername: currUsername, prevCourseName: prevCourseName, newCourseName: newCourseName, newRoomName: newRoomName, newStartTime: newStartTime, newEndTime: newEndTime, days: days, longitude: longitude, latitude: latitude);
        }
    }
}

