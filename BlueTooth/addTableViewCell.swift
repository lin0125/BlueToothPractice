//
//  addTableViewCell.swift
//  BlueTooth
//
//  Created by imac-2437 on 2023/8/28.
//

import UIKit

class addTableViewCell: UITableViewCell {
    @IBOutlet weak var blueToothName: UILabel!
    static let identifier = "addTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
