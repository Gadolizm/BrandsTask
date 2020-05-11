//
//  ViewController.swift
//  BrandsTask
//
//  Created by Gado on 10/4/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import UIKit
import ObjectMapper


class BrandsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
   
    
    var brands = [BrandModel]()

    @IBOutlet weak var brandsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureJsonFile()
        ConfigurebrandsTable()
        self.title = "Brands"
    }
    
    func ConfigurebrandsTable()  {
        brandsTableView.delegate = self
        brandsTableView.dataSource = self
        brandsTableView.register(UINib(nibName: "BrandsTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandsTableViewCell")
    }
    
    func configureJsonFile()  {
        
        
            do {
                if let file = Bundle.main.url(forResource: "Brands", withExtension: "json") {
                    let data = try Data(contentsOf: file)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let object = json as? [String: Any]  {
                        let brandsObject = Mapper<BrandModel>().mapArray(JSONArray: object["Brands"] as! [[String : Any]])
                        for brand in brandsObject{
                            brands.append(brand)
                        }
                        // json is a dictionary
                        print(brandsObject)
                        print(brands.count)
                    } else if let object = json as? [Any] {
                        // json is an array
                        print(object)
                    } else {
                        print("JSON is invalid")
                    }
                } else {
                    print("no file")
                }
            } catch {
                print(error.localizedDescription)
            }
     
        
//        guard let path = Bundle.main.path(forResource: "Brands", ofType: "json") else { return }
//        let url = URL(fileURLWithPath: path)
//
//        do {
//            let data = try Data(contentsOf: url)
//
//            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//
//            let jsonBrands = Mapper<BrandModel>().mapArray(JSONArray: [json as! [String : Any]])
//
//
//            for brand in jsonBrands{
//                brands.append(brand)
//            }
//
//        }
//        catch {
//            print(error)
//        }
        
    }
    
    //MARK: This is BrandsTable Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath as IndexPath) as! BrandsTableViewCell
        cell.brandNameLabel.text = brands[indexPath.row].name
        guard let itemURL = URL(string: brands[indexPath.row].logoImage!) else { return cell }
        cell.brandLogoImage.load(url: itemURL)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let destinationVC = sb.instantiateViewController(
            withIdentifier: "CarModelsViewController") as?  CarModelsViewController
        guard let carModels = brands[indexPath.row].carModels else {  return }
        destinationVC!.myCarModels = carModels
        self.navigationController?.pushViewController(destinationVC!, animated: true)
    }
    



}


