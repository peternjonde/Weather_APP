//
//  WelcomView.swift
//  Weather (iOS)
//
//  Created by Peter Njonde on 2021-12-13.
//

import SwiftUI
import CoreLocationUI

struct WelcomView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("Welcome to the weather app").bold().font(.title)
                
                Text("Please share your location to get weather in your area").padding()
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestlocation()
            }.cornerRadius(30).symbolVariant(.fill).foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}

