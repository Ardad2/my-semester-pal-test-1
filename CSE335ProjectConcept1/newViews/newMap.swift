//
//  newMap.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/12/23.
//

import Foundation

import MapKit
import SwiftUI

struct newMap: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion).ignoresSafeArea()
            
        }
    }
}
