//
//  Products.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 25/09/22.
//

import Foundation
import UIKit

// MARK: - Setup data model
struct Product {
    // STEP 1 - Create data model properties for products (product name, price and image collection)
    
    // STEP 2 - Create a function to generate the products data
    static func getProduct() -> [Product] {
        let products = [Product()]
        return products
    }
}
