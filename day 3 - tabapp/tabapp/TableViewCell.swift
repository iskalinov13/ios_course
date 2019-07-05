//
//  TableViewCell.swift
//  tabapp
//
//  Created by Olzhas Akhmetov on 7/3/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
