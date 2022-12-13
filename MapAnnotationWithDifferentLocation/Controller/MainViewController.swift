//
//  ViewController.swift
//  MapAnnotationWithDifferentLocation
//
//  Created by Kavya on 12/12/22.
//

import UIKit
import MapKit

class MainViewController: UIViewController {

    @IBOutlet var locationTableview: UITableView!
    @IBOutlet weak var mapView: MKMapView!

    var locations : [[String : Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //Custom load methods
    func setupUI() {
        locationTableview.delegate = self
        locationTableview.dataSource = self
        displayMultipleLocationsInMapKitView()
        locationTableview.separatorStyle = .none
    }
    
    //Method for showing multiple locations on map
    func displayMultipleLocationsInMapKitView() {
       locations = [["title": "Mumbai", "latitude":19.0760 , "longitude": 72.8777],["title": "Agra", "latitude":27.1767 , "longitude": 78.0081],["title": "Chennai", "latitude":13.0827 , "longitude": 80.2707],["title": "Bengaluru", "latitude":12.9716 , "longitude": 77.5946],["title": "Kerala", "latitude":10.1632 , "longitude": 76.6413],["title": "Noida", "latitude":28.5355 , "longitude": 77.3910]]
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            let loc = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            annotation.coordinate = loc
            mapView.addAnnotation(annotation)
            
        }
    }

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationListTableViewCell", for: indexPath) as? LocationListTableViewCell
        cell?.viewBG.backgroundColor = UIColor.lightGray
        cell?.viewBG.layer.cornerRadius = 5
        cell?.lblCityName.text = (locations[indexPath.row]["title"] as! String)
        cell?.lblLongitude.text = "Longitude: \(String(locations[indexPath.row]["longitude"] as! Double))"
        cell?.lblLatitude.text = "Latitude: \(String(locations[indexPath.row]["latitude"] as! Double))"
        return cell!
    }
    
    
}

