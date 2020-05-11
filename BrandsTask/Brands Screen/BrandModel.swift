//
//  BrandModel.swift
//  BrandsTask
//
//  Created by Gado on 10/5/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import Foundation
import ObjectMapper

class BrandModel : Mappable {

    
    var name : String?
    var logoImage : String?
    var carModels: [CarModelsModel]?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["Name"]
        logoImage <- map["Logo"]
        carModels <- map["Car Models"]
    
    }
    
}
