//
//  CarModelsTableViewCell.swift
//  BrandsTask
//
//  Created by Gado on 10/5/19.
//  Copyright © 2019 Gado. All rights reserved.
//

import UIKit

class CarModelsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var carModelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
