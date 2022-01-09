//
//  MenuViewController.swift
//  Prices
//
//  Created by erick eduardo on 07/10/21.
//

import UIKit
import SwiftUI
import Firebase
import SDWebImage

class MenuViewController: UIViewController {
    
    var items = [Item]()
    let ref = Database.database().reference()
    var cafeName: String = ""
    @IBOutlet weak var menuCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        menuCollection.register(nibCell, forCellWithReuseIdentifier: "itemCell")
        
        menuCollection.dataSource = self
        menuCollection.delegate = self
        
        getFirebaseData()
    }
    func getFirebaseData() {
        self.ref.child("cafeterias").child(cafeName.lowercased()).child("botanas")  .observeSingleEvent(of: .value) {
            (snapshot) in
            let data =  snapshot.value as? [String:Any]
            if let snacks = data {
                for snack in snacks {
                    if let product = snack.value as? [String:Any] {
                        let name = product["name"] as? String ?? ""
                        let price = product["price"] as? String ?? ""
                        let image = product["image"] as? String ?? ""
                        let item = Item(name: name, price: price, image: image)
                        self.items.append(item)
                        
                        self.menuCollection.reloadData()
                    }
                }
            }
        }
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? CollectionViewCell ?? CollectionViewCell()
        if let fileUrl = URL(string: items[indexPath.row].image) {
            item.itemImage.sd_setImage(with: fileUrl)
        }
        item.itemName.text = items[indexPath.row].name
        item.itemPrice.text = "$" + items[indexPath.row].price
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let environmentObject = Item(name: items[indexPath.row].name, price: items[indexPath.row].price, image: items[indexPath.row].image)
        let view = ItemSwiftUIView(dissmissView: dismiss)
        let vc = UIHostingController(rootView: view.environmentObject(environmentObject))
        self.present(vc, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.dismiss(animated: true)
    }
}

