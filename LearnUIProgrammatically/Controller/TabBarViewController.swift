//
//  TabBarViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 19/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .systemBackground
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: ViewController(), title: "On Boarding", image: UIImage(systemName: "character.bubble")!, selectedImage: UIImage(systemName: "character.bubble.fill")!),
            createNavController(for: ProductsViewController(), title: "Products", image: UIImage(systemName: "bag")!, selectedImage: UIImage(systemName: "bag.fill")!),
            createNavController(for: ProgressViewController(), title: "Progress", image: UIImage(systemName: "chart.bar")!, selectedImage: UIImage(systemName: "chart.bar.fill")!)
        ]
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage, selectedImage: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}
