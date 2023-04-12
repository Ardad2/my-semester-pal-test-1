//
//  WeatherViewModel.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/12/23.
//

import Foundation

struct WeatherViewModel {
    
    let weather: Weather
    
    let id = UUID()
    
    func getTemperature() -> Double {
                return 1.8 * (weather.temperature - 273) + 32
    }
    
    var temperature: Double {
        return (1.8 * (weather.temperature - 273) + 32)
    }
    
    var city: String {
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date {
        return weather.sunset
    }
    
    
}
