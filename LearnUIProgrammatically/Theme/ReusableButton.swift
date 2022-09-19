//
//  ReusableButton.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 19/09/22.
//

import UIKit

class ReusableButton: UIButton {
    
    enum backgroundColorEnum {
        case blue, red
    }
    
    var title: String
    var color: backgroundColorEnum? {
        didSet {
            testForBackgroundColor()
        }
    }
    
    init(title: String, color: backgroundColorEnum?) {
        self.title = title
        super.init(frame: .zero)
        self.color = color
        self.setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setTitle(title, for: .normal)
        self.tintColor = .white
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.testForBackgroundColor()
    }
    
    private func testForBackgroundColor() {
        
        switch color {
        case .blue:
            self.backgroundColor = .blue
        case .red:
            self.backgroundColor = .red
        case .none:
            print("none")
        }
        
    }
    
}
