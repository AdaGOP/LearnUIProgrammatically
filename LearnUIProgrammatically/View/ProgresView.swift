//
//  ProgresView.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 26/10/22.
//

import UIKit

class ProgresView: UIView {

    var progressValue: Float = 0
    
    private lazy var progressBar : UIProgressView = {
        let view = UIProgressView()
        view.setProgress(progressValue, animated: true)
        view.tintColor = .blue
        return view
    }()
    
    private lazy var addProgressButton : ReusableButton = {
        let button = ReusableButton(title: "Add progress", color: .blue)
        button.addTarget(self, action: #selector(onTapGesture), for: .touchDown)
        return button
    }()
    
    private lazy var stackView : ReusableStackView = {
        let stackV = ReusableStackView(spacingValue: 20, subView: [progressBar, addProgressButton], axisValue: .vertical, distributionValue: .fill)
        addSubview(stackV)
        return stackV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 20
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: addProgressButton, action: #selector(onTapGesture))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    func addProgress() {
        if progressValue < 1 {
            progressValue += 0.1
            progressBar.setProgress(progressValue, animated: true)
        }
    }
    
    @objc func onTapGesture(_ sender: Any) {
        addProgress()
    }
}
