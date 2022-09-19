//
//  ViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titleLabel = ReusableLabel(labelText: "Hello and welcome!", labelType: .title)
    private lazy var bodyLabel = ReusableLabel(labelText: "This place is not safe. You need two weapons below to help you attack your enemy.", labelType: .subtitle)
    
    private lazy var axeButton = ReusableButton(title: "Axe", color: .blue)
    private lazy var gunButton = ReusableButton(title: "Gun", color: .red)
    
    private lazy var buttonStackView = ReusableStackView(spacingValue: 5, subView: [gunButton, axeButton], axisValue: .horizontal, distributionValue: .fillProportionally)
    
    private lazy var spacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()
    
    private lazy var stackView = ReusableStackView(spacingValue: 5, subView: [titleLabel, bodyLabel, spacer, buttonStackView], axisValue: .vertical, distributionValue: .fill)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.size.height/7)
        ])
        
    }
    
}

