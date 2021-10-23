//
//  MenuViewController.swift
//  Prices
//
//  Created by erick eduardo on 07/10/21.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    
    let items = ["Doritos Nacho", "Tostitos Salsa Verde", "Doritos Nacho", "Tostitos Salsa Verde"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? CollectionViewCell ?? CollectionViewCell()
        item.itemImage.image = UIImage(named: "tostitos salsa verde")
        item.itemName.text = "Tostitos Salsa Verde"
        item.itemPrice.text = "$50"
        return item
    }

    @IBOutlet weak var menuCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        menuCollection.register(nibCell, forCellWithReuseIdentifier: "itemCell")
        menuCollection.dataSource = self
        menuCollection.delegate = self
    }
}
