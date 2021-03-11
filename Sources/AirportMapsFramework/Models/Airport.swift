//
//  Airport.swift
//  Verkeersles
//
//  Created by Bart Bruijnesteijn on 28/03/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI
import MapKit

public struct Airport: Codable, Hashable, Identifiable {
    private enum CodingKeys: String, CodingKey {
        case airportName, airportShortName, airportCity, airportCode, airportLongitude, airportLatitude, airportRadius
    }
    
    public let id = UUID()
    
    var airportName: String
    var airportShortName: String
    var airportCity: String
    var airportCode: String
    var airportLatitude: String
    var airportLongitude: String
    var airportRadius: String
    
    public init() {
        airportName = ""
        airportShortName = ""
        airportCity = ""
        airportCode = ""
        airportLatitude = ""
        airportLongitude = ""
        airportRadius = ""
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
}

