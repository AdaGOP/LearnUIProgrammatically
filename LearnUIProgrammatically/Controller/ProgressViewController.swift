//
//  ProgressViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 26/10/22.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let progresView = ProgresView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(progresView)
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(progresView.progressValue)
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            progresView.leftAnchor.constraint(equalTo:view.leftAnchor),
            progresView.rightAnchor.constraint(equalTo: view.rightAnchor),
            progresView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            progresView.heightAnchor.constraint(equalToConstant: view.bounds.size.height)
        ])
    }
}
