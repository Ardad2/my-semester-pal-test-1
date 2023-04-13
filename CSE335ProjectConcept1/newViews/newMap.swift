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
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 111.9281, longitude: 33.4242), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location1]()
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
                }
                
            }
            
        }
    }
}
