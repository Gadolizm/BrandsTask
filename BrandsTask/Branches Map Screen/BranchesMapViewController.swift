//
//  BranchesMapViewController.swift
//  BrandsTask
//
//  Created by Gado on 10/6/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import UIKit
import MapKit

class BranchesMapViewController: UIViewController {

    var myBranches = [BranchModel]()
    var annotations = [MKPointAnnotation()]
    
    @IBOutlet weak var branchesMapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        self.title = "Branches Map"

    }
    
    func configureMap()  {
  

        for branch in myBranches {
            
            let annotation = MKPointAnnotation()
            annotation.title = branch.name
            annotation.subtitle = branch.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: branch.latitude!, longitude: branch.longitude!)
            branchesMapView.addAnnotation(annotation)
            annotations.append(annotation)
        }
        branchesMapView.addAnnotations(annotations)

        
        
    }
    



}
