//
//  CafeteriasViewController.swift
//  Prices
//
//  Created by erick eduardo on 04/10/21.
//

import UIKit

class CafeteriasViewController: UIViewController {
    var cafes = [Cafeteria]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CafeteriasViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteria", for: indexPath) as? TableViewCell ?? TableViewCell()
        cell.cafeteriaName.text = "Facpya"
        cell.cafeteriaImage.image = UIImage(named: "facpya")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
