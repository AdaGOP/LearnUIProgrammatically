//
//  ProductsViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 25/09/22.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // STEP 1 - Instantiate data model
    let products = Product.getProduct()
    
    // MARK: - Instantiate table view
    // STEP 2 - Prepare table view and register the cell
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // STEP 3 - Add table view into the view with the contraint set up, don't forget to set the delegate and data source
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setupAutoLayout()
    }
    
    // STEP 4 - Create a function to set up the constraint of table view in the controller
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

// MARK: - Extens the controller to set up the data within table view
extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.productData = products[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailProductViewController()
        detailVC.navigationItem.title = products[indexPath.row].productName
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
