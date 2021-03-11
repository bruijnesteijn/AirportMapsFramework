//
//  AirportMapView.swift
//  Wrapper
//
//  Created by Bart Bruijnesteijn on 17/07/2020.
//

import SwiftUI

public struct AirportMapView: View {
    @State private var configuration = AirportMapConfiguration()
    @State private var changed = false
    
    @State private var actionsheetIsPresented = false
    
    public init() {
        configuration = AirportMapConfiguration()
    }
    
    public init(airport: Airport) {
        configuration = AirportMapConfiguration()
        
        configuration.airportName = airport.airportName
        configuration.airportShortName = airport.airportShortName
        configuration.airportCity = airport.airportCity
        configuration.airportCode = airport.airportCode
        configuration.airportLatitude = airport.airportLatitude
        configuration.airportLongitude = airport.airportLongitude
        configuration.airportRadius = airport.airportRadius
        configuration.airportImage = "airport"
    }
    
    public var body: some View {
        ZStack {
            MapView(configuration: $configuration, changed: $changed)
            
            VStack {
                Spacer()
                
                Button(action:{
                    self.configuration.airportRadius = String(Double(self.configuration.airportRadius)!*2)
                    
                    self.changed.toggle()
                }) {
                    HStack {
                        Text("Click to zoom out...")
                    }
                }
                .frame(width: 200, height: 30, alignment: .center)
                .padding()
                .background(Color.klm_brand)
                .foregroundColor(Color.white)
               
                Button(action:{
                    self.configuration.airportRadius = String(Double(self.configuration.airportRadius)!/2)
                    
                    self.changed.toggle()
                }) {
                    HStack {
                        Text("Click to zoom in...")
                    }
                }
                .frame(width: 200, height: 30, alignment: .center)
                .padding()
                .background(Color.klm_brand)
                .foregroundColor(Color.white)
            }
            .padding()
        }
        
        .edgesIgnoringSafeArea(.bottom)
        
        .navigationTitle(configuration.code())
    }
}

struct AdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        AirportMapView()
    }
}

