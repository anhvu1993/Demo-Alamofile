//
//  PokeTableViewCell.swift
//  DemoRequestApi
//
//  Created by Bui Van Tuan on 7/1/19.
//  Copyright © 2019 Bui Van Tuan. All rights reserved.
//

import UIKit

class PokeTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var url: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
