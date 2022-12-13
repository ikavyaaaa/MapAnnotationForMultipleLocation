//
//  LocationListTableViewCell.swift
//  MapAnnotationWithDifferentLocation
//
//  Created by Kavya on 13/12/22.
//

import UIKit

class LocationListTableViewCell: UITableViewCell {
    
    @IBOutlet var viewBG: UIView!
    @IBOutlet var lblCityName: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblLatitude: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
