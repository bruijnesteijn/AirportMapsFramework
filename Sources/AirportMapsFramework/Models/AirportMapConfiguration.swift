//
//  File.swift
//  
//
//  Created by Bart Bruijnesteijn on 22/10/2020.
//

import SwiftUI

public class AirportMapConfiguration: ObservableObject {
    
    private enum CodingKeys: String, CodingKey {
        case airportName, airportShortName, airportCity, airportCode, airportLongitude, airportLatitude, airportRadius
    }
    
    public let id = UUID()
    
    @Published var airportName: String
    @Published var airportShortName: String
    @Published var airportCity: String
    @Published var airportCode: String
    @Published var airportLatitude: String
    @Published var airportLongitude: String
    @Published var airportRadius: String
    @Published var airportImage: String

    public init() {
        airportName = "Amsterdam Airport Schiphol"
        airportShortName = "Schiphol"
        airportCity = "Amsterdam"
        airportCode = "AMS"
        airportLatitude = "52.308367"
        airportLongitude = "4.773097"
        airportRadius = "0.5"
        airportImage = "airport"
    }
    
    public func name() -> String {
        return self.airportName
    }
    
    public func shortName() -> String {
        return self.airportShortName
    }
    
    public func city() -> String {
        return self.airportCity
    }
    
    public func code() -> String {
        return self.airportCode
    }
    
    public func latitude() -> String {
        return self.airportLatitude
    }
    
    public func longitude() -> String {
        return self.airportLongitude
    }
    
    public func radius() -> String {
        return self.airportRadius
    }
    
    public func image() -> String {
        return self.airportImage
    }
    
    public func setImage(name: String) {
        self.airportImage = name
    }
}

