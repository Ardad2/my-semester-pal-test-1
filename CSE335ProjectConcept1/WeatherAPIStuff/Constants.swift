//
//  Constants.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/12/23.
//

import Foundation

struct Constants {
    struct Urls {
        static func weatherByCity(city: String) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Tempe&appid=75c9465b7903aa974a54a9be46f2e87d&")
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}

