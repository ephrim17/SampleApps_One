//
//  LocationButtonView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 18/02/25.
//


import CoreLocation
import Foundation
import UIKit
import CoreLocationUI

class MyLocationButtonView: UIView {

    lazy var locationButton: CLLocationButton = {
           let locationButton = CLLocationButton()
        locationButton.translatesAutoresizingMaskIntoConstraints = false
           locationButton.label = .shareCurrentLocation
           locationButton.icon = .arrowFilled
           locationButton.fontSize = 12
           locationButton.cornerRadius = 20
           locationButton.addTarget(self, action: #selector(userPressedLocationButton), for: .touchUpInside)
        return locationButton
    }()

    @objc func userPressedLocationButton() {
       
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        print(">>>ca lll")
        self.addSubview(locationButton)
        NSLayoutConstraint.activate([
            locationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            locationButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 30),
            locationButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

