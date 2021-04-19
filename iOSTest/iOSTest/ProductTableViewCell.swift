//
//  ProductTableViewCell.swift
//  iOSTest
//
//  Created by Ryan Enguero on 4/19/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblStockNumber: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTags: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
