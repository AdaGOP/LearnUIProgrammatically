//
//  ViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let onBoardingView = OnBoardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(onBoardingView)
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            onBoardingView.leftAnchor.constraint(equalTo:view.leftAnchor),
            onBoardingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            onBoardingView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            onBoardingView.heightAnchor.constraint(equalToConstant: view.bounds.size.height)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onBoardingView.showFirstOverlay()
    }

}

