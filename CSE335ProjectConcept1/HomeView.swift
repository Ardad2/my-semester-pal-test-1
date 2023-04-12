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
                    destination: LoginView(userData: userData),
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
                    destination: LoginView(),
                    label: {
                        Text("Settings")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
            
            VStack {
                VStack {
                    
                    Button{
                        displayEarthquakes.removeAll()
                        getJsonData(longitude: lon, latitude: lat)
                    }label: {
                        Text("Get Weather")
                    }
                    
                    Text("Welcome back \(userData.get_first_name(username: currUsername)) !")
                    Text("\(temp)")
                    
                    List {
                        ForEach(weatherList, id: \.id) { weather in
                            WeatherCell(weather: weather)
                        }
                        }
                    .listStyle(PlainListStyle())
                    
                    /*List {
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
                    }*/
                    
                    
                }
            }
            
        }
        
        .padding()
        
        
        
    }
    
    func getJsonData(longitude: Double, latitude: Double) {
        
        var addWeatherVM = AddWeatherViewModel()
        addWeatherVM.save { weather in addWeather(weather)
            
        }
        
        
        
        var long = (Double(round(100 * longitude) / 100))
        if (long < 0)
        {
            long = long * (-1.0)
        }
        
        var lati = (Double(round(100 * latitude) / 100))
        
        if (lati < 0)
        {
            lati = lati * (-1.0)
        }
        
        
        var north = lati + 10.0
        var south = lati - 10.0
        var east = long - 10.0
        var west = long + 10.0
        
        north = Double(round(100 * north) / 100)
        south = Double(round(100 * south) / 100)
        east = Double(round(100 * east) / 100)
        west = Double(round(100 * west) / 100)
        
        
        
        //let urlAsString = "http://api.geonames.org/earthquakesJSON?north=" + String(north) + "&south=" + String(south) + "&east=" + String(east) + "&west=" + String(west) + "&username=arjdad"
            // print(urlAsString)
        
        let urlAsString = "https://api.openweathermap.org/data/2.5/weather?lat=33.427204&lon=-111.939896&appid=75c9465b7903aa974a54a9be46f2e87d&units=imperial"
        
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared

        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            var count = 0;
            
            do {
                //let decodedData = try JSONDecoder().decode(Welcome.self, from: data!)
                
                //for earth in decodedData.main {
                  //  let currDatetime = earth.datetime
                    //let currMagnitude = earth.magnitude
                    //displayEarthquakes.append(displayEarthquake(datetime: currDatetime, magnitude: String(currMagnitude)))

                //}
                
                //temp = decodedData.main.tempMax;
                
                //print(decodedData.main.temp)
                

                
                //let currDatetime = decodedData.earthquakes[count].datetime;
                //let currMagnitude = String(decodedData.earthquakes[count].magnitude)
                

                
                
                //displayEarthquakes = decodedData.earthquakes;
                
                //print(decodedData.earthquakes[0].src)
                
               // location = decodedData.earthQuakeData[0].placeName
                //longitute = String(decodedData.postalcodes[0].lng)
                //latitude = String(decodedData.postalcodes[0].lat)
                
            } catch {
                print("error: \(error)")
            }
        })
        jsonQuery.resume()
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
                
                Text("\(Int(weather.temperature)) K")
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

        }
    }
    

        
    }


