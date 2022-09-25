//
//  ViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: ReusableLabel = {
        let label = ReusableLabel(labelText: "Hello and welcome!", labelType: .title)
        return label
    }()
    
    private lazy var bodyLabel: ReusableLabel = {
        let label = ReusableLabel(labelText: "This place is not safe. You need two weapons below to help you attack your enemy.", labelType: .subtitle)
        return label
    }()
    
    private lazy var axeButton: ReusableButton = {
        let button = ReusableButton(title: "Axe", color: .blue)
        return button
    }()
    
    private lazy var gunButton: ReusableButton = {
        let button = ReusableButton(title: "Gun", color: .red)
        return button
    }()
    
    private lazy var buttonStackView: ReusableStackView = {
        let stackV = ReusableStackView(spacingValue: 5, subView: [gunButton, axeButton], axisValue: .horizontal, distributionValue: .fillProportionally)
        return stackV
    }()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showFirstOverlay()
    }
    
    func showFirstOverlay() {
        let overlayView = OverlayOnBoarding(title: "This is your last chance. After this there is no turning back. You take the axe, the story ends if that is not the right moment; you wake up in your bed and believe whatever you want to believe.", anchorView: axeButton)
        overlayView.frame = view.frame
        view.addSubview(overlayView)
        
        overlayView.onTap = { [weak self, weak overlayView] in
            overlayView?.hideOverlay { _ in
                overlayView?.removeFromSuperview()
                self?.showSecondOverlay()
            }
        }
        overlayView.showOverlay()
    }
    
    func showSecondOverlay() {
        let overlayView = OverlayOnBoarding(title: "You take the gun, you could win. But if then you stay in Wonderland and I show you how deep the rabbit hole goes.", anchorView: gunButton)
        overlayView.frame = view.frame
        view.addSubview(overlayView)
        
        overlayView.onTap = { [weak overlayView] in
            overlayView?.hideOverlay { _ in
                overlayView?.removeFromSuperview()
            }
        }
        overlayView.showOverlay()
    }

}

