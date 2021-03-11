//
//  MapViewController.swift
//  Wrapper
//
//  Created by Bart Bruijnesteijn on 17/07/2020.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    var locationManager = CLLocationManager.init()
    
    var mapview = MKMapView()
    
    var configuration = AirportMapConfiguration()
    var changed = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
         
        mapview = MKMapView()
        mapview.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)

        mapview.mapType = .standard
        mapview.showsUserLocation = true
        mapview.isRotateEnabled = true
        mapview.isZoomEnabled = true
        mapview.showsCompass =  true
        mapview.setUserTrackingMode(.followWithHeading, animated: true)
        mapview.showsScale = true
        
        mapview.delegate = self
        
        mapview.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(configuration.airportLatitude)!, longitude: Double(configuration.airportLongitude)!), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(configuration.airportLatitude)!, longitude: Double(configuration.airportLongitude)!)
        annotation.title = "Title"
        annotation.subtitle = "SubTitle"
        mapview.addAnnotation(annotation)
        
        self.view.addSubview(mapview)
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    }
    
    func updateController(){
        mapview.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)

        let radius = Double(configuration.airportRadius)
        mapview.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(configuration.airportLatitude)!, longitude: Double(configuration.airportLongitude)!), span: MKCoordinateSpan(latitudeDelta: radius!, longitudeDelta: radius!))
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView()

        annotationView.pinTintColor = UIColor(named: "klm_blue")
        
        return annotationView
    }
}
