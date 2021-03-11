//
//  Airports.swift
//  AirportMapFramework
//
//  Created by Bart Bruijnesteijn on 21/05/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI
import MapKit

public class Airports: ObservableObject {
    @Published public var maps: [Airport] = []
    
    @Published public var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan(latitudeDelta: 100.0, longitudeDelta: 100.0))
    
    public init() {
        fetchMaps()
    }
    
    private func fetchMaps() {
        guard let url = Bundle.module.url(forResource: "Airports", withExtension: "json") else {
            fatalError("Failed to locate file in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file from bundle.")
        }

        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Airport].self, from: data) else {
            fatalError("Failed to decode file from bundle.")
        }
        
        maps = decoded
    }
    
    public func region(index: Int) {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(maps[index].airportLatitude)!, longitude: Double(maps[index].airportLongitude)!), span: MKCoordinateSpan(latitudeDelta: Double(maps[index].airportRadius)!, longitudeDelta: Double(maps[index].airportRadius)!))
    }
}


