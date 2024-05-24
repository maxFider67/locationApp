//
//  Location.swift
//  locationApp
//
//  Created by dtdigital on 23/05/24.
//

import Foundation
import CoreLocation

class GeoLocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = GeoLocationManager()
    
    private let locationManager = CLLocationManager()
    private var locationCallback: ((CLLocation?, Error?) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getCurrentLocation(completion: @escaping (CLLocation?, Error?) -> Void) {
        locationCallback = completion
        print("Requesting current location")
        locationManager.requestLocation()
    }
    
    func stopMonitoringLocationChanges() {
        print("Stopping to monitor location changes")
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Location update received: \(location.coordinate)")
            locationCallback?(location, nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
        locationCallback?(nil, error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            print("Permissão de localização autorizada (Quando em uso)")
        case .denied:
            print("Permissão de localização negada")
        case .notDetermined:
            print("Permissão de localização não determinada")
        default:
            print("Status de autorização de localização desconhecido")
        }
    }
}
