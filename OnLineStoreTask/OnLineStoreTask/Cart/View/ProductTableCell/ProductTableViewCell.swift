//
//  ProductTableViewCell.swift
//  OnLineStoreTask
//
//  Created by Gado on 26/08/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
     @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    static let identifier = "ProductTableViewCell"
    
    
    // MARK: - Override Functions
    // viewDidLoad
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func modify(product: Product){
        self.productNameLabel.text = product.name
        self.productPriceLabel.text =  String("\(product.price)$")
    }
    
    
}
