//
//  TestView.swift
//  CSE335ProjectConcept1
//
//  Created by Arjun Dadhwal on 4/7/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI
import CoreData

struct earthquakeData : Decodable
{
    let earthquakes:[earthquake]
}

struct earthquake : Decodable
{
    let datetime:String
    //let depth:Double
    //let lng:Double
    let src:String
    let eqid: String
    let magnitude: Double
    //let lat:Double
}

struct displayEarthquake : Identifiable
{
    var id = UUID()
    var datetime:String
    var magnitude:String
    
}

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}


struct HomeView: View {
    
    @State var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }


    
    @State var currUsername: String = ""
    @StateObject var userData:userDictionary = userDictionary()
    



    
    @State var displayEarthquakes:[displayEarthquake]
    
    

    private static let defaultLocation = CLLocationCoordinate2D(
        latitude: 33.4255,
        longitude: -111.9400
    )
    
    @State private var region = MKCoordinateRegion(
        center: defaultLocation,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    @State private var markers = [
        Location(name: "Tempe", coordinate: defaultLocation)
    ]
    
    
    @State var location: CLLocationCoordinate2D?

    
    @State var address:String
    @State var lon:Double
    @State var lat:Double
    
    @State var temp:String
    

    var body: some View {
        VStack {
            HStack {
                NavigationLink(
                    destination: userDetails(userData: userData, currUsername: currUsername),
                    label: {
                        Text("\(currUsername)")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: MyCoursesView(userData:userData, currUsername: currUsername),
                    label: {
                        Text("My Courses")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: LoginView(loginStatus:"Successfully logged out", userData: userData),
                    label: {
                        Text("Log Out")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
            
            VStack {
                VStack {
                    
                    Text("Welcome back \(userData.get_first_name(username: currUsername)) !")
                    
                    List {
                        ForEach(weatherList, id: \.id) { weather in
                            WeatherCell(weather: weather)
                        }
                        }
                    .listStyle(PlainListStyle())
                    
                    List {
                        Section(header: ListHeader())
                        {
                            ForEach(userData.get_user(currUsername).taskData.list)
                            {
                                datum in NavigationLink(destination: taskDetails(userData:userData, currUsername: currUsername, courseName: datum.get_class_name(), taskName: datum.get_task_name())){VStack()
                                {
                                    HStack {
                                        Text(datum.get_task_name());
                                        Text(datum.get_class_name());
                                        Text(datum.get_due_date_string())
                                        Spacer();
                                    }
                                }
                            }
                            }
                        }
                    }.listStyle(PlainListStyle())
                    
                    
                }
            }
            
        }.onAppear{getWeather()
            
        }
        
        .padding()
        
        
        
    }
    
    func getWeather() {
        
        var addWeatherVM = AddWeatherViewModel()
        addWeatherVM.save { weather in addWeather(weather)
            
        }
    }
    
    func getTemperature() {
        
    }
    
    struct ListHeader: View {
        var body: some View {
            HStack {
                Text("TASK LIST ")
            }
        }
    }
    
    struct WeatherCell: View {
        
        let weather: WeatherViewModel
        
        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(weather.city)
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName: "sunrise")
                        Text("\(weather.sunrise.formatAsString())")
                    }
                    HStack {
                        Image(systemName: "sunset")
                        Text("\(weather.sunset.formatAsString())")
                    }
                }
                Spacer()
                URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                    .frame(width: 50, height: 50)
                
                Text("\(Int(weather.temperature)) F")
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

        }
    }
    

        
    }


