//
//  ListCell.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 23/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    

    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
