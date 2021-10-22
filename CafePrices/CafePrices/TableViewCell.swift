//
//  TableViewCell.swift
//  Prices
//
//  Created by erick eduardo on 04/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeteriaButton: UIButton!
    @IBOutlet weak var cafeteriaImage: UIImageView!
    @IBOutlet weak var cafeteriaName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
