//
//  TableViewCell.swift
//  Prices
//
//  Created by erick eduardo on 04/10/21.
//

import UIKit
import MapKit



class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeteriaImage: UIImageView!
    @IBOutlet weak var cafeteriaName: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func showMap(_ sender:Any) {
        print("entre en la funciòn")
            let latitude:CLLocationDegrees = 25.725028883653522
            let longitude:CLLocationDegrees = -100.31349767364817
            let regionDistance: CLLocationDegrees = 1000
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "FIME"
            mapItem.openInMaps(launchOptions: options)
            
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
