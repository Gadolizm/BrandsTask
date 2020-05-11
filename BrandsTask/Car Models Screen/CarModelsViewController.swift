//
//  CarModelsViewController.swift
//  BrandsTask
//
//  Created by Gado on 10/5/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import UIKit
import MapKit

class CarModelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myCarModels = [CarModelsModel]()

    
    @IBOutlet weak var carModelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigurebrandsTable()
        self.title = "Car Models"

        // Do any additional setup after loading the view.
    }
    
    func ConfigurebrandsTable()  {
        carModelsTableView.delegate = self
        carModelsTableView.dataSource = self
        carModelsTableView.register(UINib(nibName: "CarModelsTableViewCell", bundle: nil), forCellReuseIdentifier: "CarModelsTableViewCell")
    }
    
    
    // MARK: UITableViewDelegate, UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCarModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarModelsTableViewCell", for: indexPath as IndexPath) as! CarModelsTableViewCell
        cell.carModelLabel.text = myCarModels[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let destinationVC = sb.instantiateViewController(
            withIdentifier: "BranchesMapViewController") as?  BranchesMapViewController
        guard let branches = myCarModels[indexPath.row].branches else {  return }
        destinationVC!.myBranches = branches
        self.navigationController?.pushViewController(destinationVC!, animated: true)

    }
    

}
