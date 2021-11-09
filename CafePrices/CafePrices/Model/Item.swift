//
//  item.swift
//  CafePrices
//
//  Created by erick eduardo on 23/10/21.
//

import Foundation
class Item: ObservableObject {
    @Published var itemName: String = "dorito"
    @Published var itemPrice: String = "$78"
    @Published var itemImage: String = "lonche"
    
    init(itemName: String, itemPrice: String, itemImage: String){
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.itemImage = itemImage
    }
}
