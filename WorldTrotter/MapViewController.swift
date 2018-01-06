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
	}
	
	override func viewDidLoad() {
		
	}
}
