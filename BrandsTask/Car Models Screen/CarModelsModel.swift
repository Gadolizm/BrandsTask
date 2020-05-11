//
//  CarModelsModel.swift
//  BrandsTask
//
//  Created by Gado on 10/5/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import Foundation
import ObjectMapper


class CarModelsModel: Mappable {
    

    var name : String?
    var branches: [BranchModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["Model Name"]
        branches <- map["Branches"]
        
    }
}




class BranchModel: Mappable {
    

    var name : String?
    var address : String?
    var latitude: Double?
    var longitude: Double?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["Name"]
        address <- map["Address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]

        
        
    }
}
