//
//  CafeteriasViewController.swift
//  Prices
//
//  Created by erick eduardo on 04/10/21.
//

import UIKit
import Firebase
import SDWebImage

class CafeteriasViewController: UIViewController {
    
    var cafes = [Cafeteria]()
    let ref = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getFirebaseData()
    }
    
    func getFirebaseData() {
        self.ref.child("cafeterias").observeSingleEvent(of: .value) {
            (snapshot) in
            let data = snapshot.value as? [String:Any]
            if let cafeterias = data {
                for cafe in cafeterias {
                    if let cafeFirebase = cafe.value as? [String:Any] {
                        let name = cafeFirebase["name"] as? String ?? ""
                        let image = cafeFirebase["image"] as? String ?? ""
                        let cafeteria = Cafeteria(name: name, image: image)
                        self.cafes.append(cafeteria)
                        
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}

extension CafeteriasViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteria", for: indexPath) as? TableViewCell ?? TableViewCell()
        cell.cafeteriaName.text = cafes[indexPath.row].name
        if let fileUrl = URL(string: cafes[indexPath.row].image) {
            cell.cafeteriaImage.sd_setImage(with: fileUrl)
        }
        cell.cafeteriaImage.layer.cornerRadius = cell.frame.height/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else { return }
        vc.cafeName = cafes[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


