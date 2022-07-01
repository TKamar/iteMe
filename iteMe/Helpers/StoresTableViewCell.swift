//
//  StoresTableViewCell.swift
//  iteMe
//
//  Created by user216739 on 7/1/22.
//

import UIKit

class StoresTableViewCell: UITableViewCell {
    
    @IBOutlet var storeLBL: UILabel!
    @IBOutlet var storeIMG: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
