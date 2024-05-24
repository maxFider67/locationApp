//
//  LocationViewController.swift
//  locationApp
//
//  Created by dtdigital on 23/05/24.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    private let geoLocationManager = GeoLocationManager.shared
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Current Location"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
        requestLocation()
    }
    
    private func setupUI() {
        view.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func requestLocation() {
        geoLocationManager.getCurrentLocation { [weak self] location, error in
            guard let self = self else { return }
            if let location = location {
                self.locationLabel.text = "Latitude: \(location.coordinate.latitude)\nLongitude: \(location.coordinate.longitude)"
            } else if let error = error {
                print("Error retrieving location: \(error.localizedDescription)")
                self.locationLabel.text = "Error: \(error.localizedDescription)"
            }
        }
    }
}
