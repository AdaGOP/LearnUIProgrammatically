//
//  ProductTableViewCell.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 25/09/22.
//

import UIKit

// MARK: - Setup custom table view cell
class ProductTableViewCell: UITableViewCell {
    
    // STEP 3 - Iniate the product data
    var productData: Product? {
        // STEP 6 - Set the initial value
        didSet {
            // guard let to safe unwrap the Product
            
            // if let to safe unwrap each property into UI component (the name, price, and images) within cell
            
                // Set the name and price
                
                // Using for loop to set the image collection contentMode, cornerRadius, borderWith, border Color, and clipsToBounds
                
        }
    }
    
    // STEP 1 - Override init the table view style
    
    // STEP 4 - Add subview to the cell's content view and set up auto layout
   
    
    // STEP 2 - Create a label to display product name and product price, a stack view to display the image collections, and a container stack view to wrap all those components
    

    // STEP 5 - Set up constraints for the container stack view
    private func setupAutoLayout() {
    
    }
}
