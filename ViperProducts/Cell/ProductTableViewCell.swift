//
//  ProductTableViewCell.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewItem: UIView!
    @IBOutlet weak var lblItemColor: UILabel!
    @IBOutlet weak var lblItemSKU: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemDescription: UILabel!
    
    var product = Product()
    var colors = [Color]()
    
    var position = 0
   
    override func awakeFromNib() {
        super.awakeFromNib()
        customView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func customView() {
        
        viewItem.layer.shadowOpacity = 0.7
        viewItem.layer.shadowRadius = 2
        viewItem.layer.shadowColor = UIColor.lightGray.cgColor
        viewItem.layer.shadowOffset = .zero

        viewItem.layer.cornerRadius = 8
    }
    
    func setInformationItem() {
        self.lblItemSKU.text = product.sku
        self.lblItemName.text = product.name
        self.lblItemDescription.text = product.errorDescription
        
    }
    
}
