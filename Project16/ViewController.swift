//
//  ViewController.swift
//  Project16
//
//  Created by Subhrajyoti Chakraborty on 14/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Capital Map"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map type", style: .plain, target: self, action: #selector(switchMapType))
        
        let delhi = Capital(coordinate: CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025), title: "Delhi", info: "This is Delhi")
        let london = Capital(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), title: "London", info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), title: "Oslo", info: "Founded over a thousand years ago.")
        let paris = Capital(coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), title: "Paris", info: "Often called the City of Light.")
        let rome = Capital(coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), title: "Rome", info: "Has a whole country inside it.")
        let washington = Capital(coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), title: "Washington DC", info: "Named after George himself.")
        
        //        mapView.addAnnotation(london)
        //        mapView.addAnnotation(oslo)
        //        mapView.addAnnotation(paris)
        //        mapView.addAnnotation(rome)
        //        mapView.addAnnotation(washington)
        
        //        Alternate to addAnnotation is given below
        
        mapView.addAnnotations([delhi, london, oslo, paris, rome, washington])
    }
    
    @objc func switchMapType() {
        let ac = UIAlertController(title: "Switch Map Type?", message: "Please select a map type", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite Mode", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Standard Mode", style: .default, handler: { [weak self] action in
            self?.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Hybrid Mode", style: .default, handler: { [weak self] action in
            self?.mapView.mapType = .hybrid
        }))
        
        present(ac, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {
            return nil
        }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.pinTintColor = .green
            annotationView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else {
            return
        }
        
        let placeName = capital.title
        //        let placeInfo = capital.info
        
        let vc = DetailViewController()
        let url = URL(string: "https://en.wikipedia.org/wiki/" + (placeName ?? "delhi"))!
        vc.urlData = URLRequest(url: url)
        navigationController?.pushViewController(vc, animated: true)
        
        //        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        //        ac.addAction(UIAlertAction(title: "OK", style: .default))
        //        present(ac, animated: true)
    }
    
}

