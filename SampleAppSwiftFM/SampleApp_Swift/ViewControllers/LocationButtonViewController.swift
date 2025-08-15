//
//  LocationButtonViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 18/02/25.
//

import UIKit

class LocationButtonViewController: UIViewController {
    
    private lazy var LocationButtonView: MyLocationButtonView = {
        let view = MyLocationButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LocationButtonView.loadViewSetup(self.LocationButtonView, parentView: self.view)
    }

}
