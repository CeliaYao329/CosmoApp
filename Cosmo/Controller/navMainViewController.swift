//
//  navMainViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit
import MapKit

class navMainViewController: UIViewController {

    var focusProduct : Product = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?
    
    private var destinations : [MKPointAnnotation] = []
    private var currentRoute : MKRoute?
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var focusProductImageView: UIImageView!
    @IBOutlet weak var focusProductNameLabel: UILabel!
    @IBOutlet weak var focusProductDescriptionLabel: UILabel!
    @IBOutlet weak var focusProductPriceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureLocationServices()
        mapView.delegate = self
        
        //Writing the subview
        focusProductImageView.image = focusProduct.picture
        focusProductNameLabel.text = focusProduct.productName
        focusProductDescriptionLabel.text = focusProduct.description
        focusProductPriceLabel.text = "\(focusProduct.capacity) oz. $\(focusProduct.price)"
    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        
        let locationAuthStatus = CLLocationManager.authorizationStatus()
        if locationAuthStatus == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }else if locationAuthStatus == .authorizedAlways || locationAuthStatus == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate:CLLocationCoordinate2D){
        let zoomRegion = MKCoordinateRegion(center: coordinate,latitudinalMeters: 3000,longitudinalMeters: 3000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    private func addAnnotations(){
        //creat annotation (coordinates, titles)
        let targetStoreAnnotation = MKPointAnnotation()
        targetStoreAnnotation.title = "Best choice"
        targetStoreAnnotation.coordinate = CLLocationCoordinate2D(latitude: 40.7610599, longitude: -73.9750055)
        
        let targetStoreAnnotation2 = MKPointAnnotation()
        targetStoreAnnotation2.title = "Also something"
        targetStoreAnnotation2.coordinate = CLLocationCoordinate2D(latitude: 40.7619047, longitude: -73.9668278)
        
        let targetStoreAnnotation3 = MKPointAnnotation()
        targetStoreAnnotation3.title = "Also something"
        targetStoreAnnotation3.coordinate = CLLocationCoordinate2D(latitude: 40.7647647, longitude: -73.9660894)
        
        destinations.append(targetStoreAnnotation)
        
        mapView.addAnnotation(targetStoreAnnotation)
        mapView.addAnnotation(targetStoreAnnotation2)
        mapView.addAnnotation(targetStoreAnnotation3)
        
    }
    
    private func constructRoute(userLocation: CLLocationCoordinate2D){
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinations[0].coordinate))
        directionRequest.requestsAlternateRoutes = true
        directionRequest.transportType = .any //need modify
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { [weak self] (directionResponse, error) in
            guard let strongSelf = self else { return }
            if let error = error{
                print(error.localizedDescription)
            }else if let response = directionResponse, response.routes.count > 0 {
                strongSelf.currentRoute = response.routes[0]
                strongSelf.mapView.addOverlay(response.routes[0].polyline)
                print(response.routes[0].expectedTravelTime)
                strongSelf.mapView.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    @IBAction func gotoStoreProductView(_ sender: Any) {
        performSegue(withIdentifier: "fromNavMainToStoreProduct", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension navMainViewController: CLLocationManagerDelegate{
    
    //redering route lines
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let currentRoute = currentRoute else{
            return MKOverlayRenderer()
        }
        
        let polyLineRenderer = MKPolylineRenderer(polyline: currentRoute.polyline)
        polyLineRenderer.strokeColor = UIColor.orange
        polyLineRenderer.lineWidth = 5
        return polyLineRenderer
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did get location")
        guard let latestLocation = locations.first else {return}
        
        if currentLocation == nil{
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
            constructRoute(userLocation: latestLocation.coordinate)
            //in this case, construct route right after get the new location
        }
        
        currentLocation = latestLocation.coordinate
    }
    
    //when users change their location permission settings
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension navMainViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        var pinImage:UIImage?
        if let title = annotation.title, title == "Best choice"{
            pinImage = UIImage(named: "bestStore")
        }else if let title = annotation.title, title == "Also something"{
            pinImage = UIImage(named: "storeLoc")
        }else if annotation === mapView.userLocation{
            pinImage = UIImage(named: "Portrait") //show the user Profile
        }
        
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        annotationView?.image = resizedImage
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("select annotation: \(String(describing: view.annotation?.title))")
    }
    
}
