//
//  MapView.swift
//  AirportMaps
//
//  Created by Bart Bruijnesteijn on 12/07/2020.
//

import SwiftUI

struct MapView:
    UIViewControllerRepresentable {
    typealias UIViewControllerType = MapViewController
    
    @Binding var configuration: AirportMapConfiguration
    @Binding var changed: Bool

    func makeUIViewController(context: Context) -> MapViewController {
        let controller = MapViewController()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        uiViewController.configuration = self.configuration
        uiViewController.changed = self.changed
        
        uiViewController.updateController()
    }
}

