//
//  CafeteriasViewController.swift
//  Prices
//
//  Created by erick eduardo on 04/10/21.
//

import UIKit
import Firebase
import SDWebImage
class CafeteriasViewController: UIViewController  {
    
    var cafes = [Cafeteria]()
    let ref = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dataFirebase()
    }
    
    func dataFirebase() {
        self.ref.child("cafeterias").observeSingleEvent(of: .value){
            (snapshot) in
            let data = snapshot.value as? [String:Any]
            if let unwrapped = data {
                for cafe in unwrapped{
                    let  cafeFirebase = cafe.value as! [String:Any]
                    let cafet = Cafeteria(cafeteriaName:cafeFirebase["name"] as! String, cafeteriaImage: cafeFirebase["image"] as! String)
                    self.cafes.append(cafet)
                    self.tableView.reloadData()
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
        cell.cafeteriaName.text = cafes[indexPath.row].cafeteriaName
        let fileUrl = URL(string: cafes[indexPath.row].cafeteriaImage)
        cell.cafeteriaImage.sd_setImage(with: fileUrl)
        cell.cafeteriaImage.layer.cornerRadius = cell.frame.height/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else { return }
        vc.cafeName = cafes[indexPath.row].cafeteriaName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
