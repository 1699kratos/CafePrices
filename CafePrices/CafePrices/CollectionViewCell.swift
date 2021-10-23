//
//  CollectionViewCell.swift
//  Prices
//
//  Created by erick eduardo on 06/10/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
