//
//  MenuViewController.swift
//  Prices
//
//  Created by erick eduardo on 07/10/21.
//

import UIKit
import SwiftUI

class MenuViewController: UIViewController {
    var items = [Item]()
    @IBOutlet weak var menuCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        menuCollection.register(nibCell, forCellWithReuseIdentifier: "itemCell")
        menuCollection.dataSource = self
        menuCollection.delegate = self
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? CollectionViewCell ?? CollectionViewCell()
        item.itemImage.image = UIImage(named: "tostitos salsa verde")
        item.itemName.text = "Tostitos Salsa Verde"
        item.itemPrice.text = "$50"
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let environmentObject = Item(itemName: "Lonche", itemPrice: "50", itemImage: "lonche")
        let view = ItemSwiftUIView(dissmissView: dismiss)
        let vc = UIHostingController(rootView: view.environmentObject(environmentObject))
        self.present(vc, animated: true, completion: nil)
        
    }
    
     func dismiss() {
        self.dismiss(animated: true) 
    }
}
