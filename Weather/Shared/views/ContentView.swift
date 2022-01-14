//
//  ContentView.swift
//  Shared
//
//  Created by Peter Njonde on 2021-12-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManger = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather{
                    weatherView(weather: weather)
                }
                else{
                    loadingView().task{
                        do {
                            weather = try await weatherManger.getCurrentWeather(latitude: location.latitude, longitude: location.longitude )
                        }catch{
                            print("Error getting weather: \(error)")
                        
                        }
                    }
                }
            }
            else {
                if locationManager.isloading{
                    loadingView()
                }
                else{
                    WelcomView().environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.582, saturation: 0.925, brightness: 0.604)).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
