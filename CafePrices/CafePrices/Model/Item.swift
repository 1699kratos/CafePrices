//
//  item.swift
//  CafePrices
//
//  Created by erick eduardo on 23/10/21.
//

import Foundation
class Item: ObservableObject {
    @Published var name: String
    @Published var price: String
    @Published var image: String 
    
    init(name: String, price: String, image: String){
        self.name = name 
        self.price = price
        self.image = image
    }
}
