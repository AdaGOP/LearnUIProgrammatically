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
    // STEP 1 - Create data model properties for products
    let productName: String?
    let productPrice: String?
    let productImages: [UIImageView]?
    
    // STEP 2 - Create a function to generate the products data
    static func getProduct() -> [Product] {
        let products = [
            Product(productName: "iPhone 12", productPrice: "Rp 11.299.000", productImages: [UIImageView(image: UIImage(named: "12-1")), UIImageView(image: UIImage(named: "12-2")), UIImageView(image: UIImage(named: "12-3"))]),
            Product(productName: "iPhone 12 Pro", productPrice: "Rp 15.799.000", productImages: [UIImageView(image: UIImage(named: "12-pro-1")), UIImageView(image: UIImage(named: "12-pro-2")), UIImageView(image: UIImage(named: "12-pro-3"))]),
            Product(productName: "iPhone 13", productPrice: "Rp 13.749.000", productImages: [UIImageView(image: UIImage(named: "13-1")), UIImageView(image: UIImage(named: "13-2")), UIImageView(image: UIImage(named: "13-3"))]),
            Product(productName: "iPhone 13 Pro", productPrice: "Rp 17.449.000", productImages: [UIImageView(image: UIImage(named: "13-pro-1")), UIImageView(image: UIImage(named: "13-pro-2")), UIImageView(image: UIImage(named: "13-pro-3"))])
        ]
        return products
    }
}
