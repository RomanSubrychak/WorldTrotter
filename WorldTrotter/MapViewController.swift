//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Roman Subrychak on 1/2/18.
//  Copyright © 2018 Roman Subrychak. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
	
	var mapView: MKMapView!
	
	override func loadView() {
		
		// create a map view
		mapView = MKMapView()
		
		// set it as *the* view of this view controller
		view = mapView
		
		let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
		segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
		segmentedControl.selectedSegmentIndex = 0
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
	}
	
	override func viewDidLoad() {
		
	}
}
