//
//  CSE335ProjectConcept1App.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import SwiftUI

@main
struct CSE335ProjectConcept1App: App {
    
    var body: some Scene {
        WindowGroup {
            LoginView(dataController: coreDataController())
        }
    }
}
