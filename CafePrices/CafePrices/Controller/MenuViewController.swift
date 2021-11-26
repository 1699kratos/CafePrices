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
        dataFirebase()
    }
    func dataFirebase() {
        self.ref.child("cafeterias").child(cafeName).child("botanas").observeSingleEvent(of: .value){
            (snapshot) in
            let data =  snapshot.value as? [String:Any]
            if let unwrapped = data {
                for snack in unwrapped{
                    let name = snack.value as! [String:Any]
                    let item = Item(itemName: name["name"] as! String,
                                          itemPrice: name["price"] as! String,
                                          itemImage: name["image"] as! String)
                    self.items.append(item)
                    self.menuCollection.reloadData()
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
        let fileUrl = URL(string: items[indexPath.row].itemImage)
        item.itemImage.sd_setImage(with: fileUrl)
        item.itemName.text = items[indexPath.row].itemName
        item.itemPrice.text = "$" + items[indexPath.row].itemPrice
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let environmentObject = Item(itemName: items[indexPath.row].itemName, itemPrice: items[indexPath.row].itemPrice, itemImage: items[indexPath.row].itemImage)
        let view = ItemSwiftUIView(dissmissView: dismiss)
        let vc = UIHostingController(rootView: view.environmentObject(environmentObject))
        self.present(vc, animated: true, completion: nil)
        
    }
    
     func dismiss() {
        self.dismiss(animated: true)
    }
}
