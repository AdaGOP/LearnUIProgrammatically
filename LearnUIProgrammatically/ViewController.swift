//
//  ViewController.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let titleLbl = UILabel()
        titleLbl.text = "Hello and welcome!"
        titleLbl.font = .boldSystemFont(ofSize: 24)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        return titleLbl
    }()
    
    private lazy var bodyLabel: UILabel = {
        let bodyLbl = UILabel()
        bodyLbl.text = "This place is not safe. You need two weapons below to help you attack your enemy."
        bodyLbl.numberOfLines = 0
        bodyLbl.translatesAutoresizingMaskIntoConstraints = false
        return bodyLbl
    }()
    
    private lazy var spacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()
    
    private lazy var axeButton: UIButton = {
        let blueBtn = UIButton()
        blueBtn.backgroundColor = .blue
        blueBtn.setTitle("Axe", for: .normal)
        blueBtn.tintColor = .white
        blueBtn.layer.cornerRadius = 5
        blueBtn.clipsToBounds = true
        blueBtn.translatesAutoresizingMaskIntoConstraints = false
        return blueBtn
    }()
    
    private lazy var gunButton: UIButton = {
        let redBtn = UIButton()
        redBtn.backgroundColor = .red
        redBtn.setTitle("Gun", for: .normal)
        redBtn.tintColor = .white
        redBtn.layer.cornerRadius = 5
        redBtn.clipsToBounds = true
        redBtn.translatesAutoresizingMaskIntoConstraints = false
        return redBtn
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gunButton, axeButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, spacer, buttonStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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

