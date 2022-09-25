//
//  ProductsViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 25/09/22.
//

import UIKit

// MARK: - Generate a view controller to display product data
class ProductsViewController: UIViewController {
    
    // STEP 1 - Instantiate data model from struct of Product
    
    
    // STEP 2 - Prepare table view and register the cell
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Register table view cell
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // STEP 3 - Add table view into the view with the contraint set up, don't forget to set the delegate and data source
        
        setupAutoLayout()
    }
    
    // STEP 4 - Create a function to set up the constraint of table view in the controller
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
        ])
    }

}

// MARK: - Extens the controller to set up the data within table view
extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Step 5 - Return to the number of product data to be displayed
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Step 6 - Set up the cell properties
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Step 7 - Set up the controller destination for each interaction to the cell
        
        // Step 8 - Set up the controller destination's navigation item title
        
        // Step 9 - Navigate to the controller destination
        
    }
    
    
}
