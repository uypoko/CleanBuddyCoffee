//
//  SetAddressOnMapSetAddressOnMapViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 22/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SetAddressOnMapViewController: UIViewController, SetAddressOnMapViewInput {

    // MARK: IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var output: SetAddressOnMapViewOutput!

    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            DispatchQueue.main.async {
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        default:
            break
        }
    }
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
        displayUserAddress()
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func displayUserAddress() {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        //guard let previousLocation = self.previousLocation else { return }
        //guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let _ = error {
                //TODO: Show alert informing the user
                return
            }
            guard let placemark = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            let districtName = placemark.subLocality ?? ""
            
            DispatchQueue.main.async {
                self.addressLabel.text = "\(streetNumber) \(streetName), \(districtName)"
            }
        }
    }
}


extension SetAddressOnMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension SetAddressOnMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
        //displayUserAddress()
    }
}
