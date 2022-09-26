//
//  ReusableLabel.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 19/09/22.
//

import UIKit

class ReusableLabel: UILabel {

    enum labelTypeEnum {
        case title, subtitle
    }
    
    public private(set) var labelType : labelTypeEnum
    public private(set) var labelText: String
    
    init(labelText: String, labelType: labelTypeEnum) {
        /// Safety check 1 “A designated initializer must ensure that all of the “properties introduced by its class are initialized before it delegates up to a superclass initializer.”
        self.labelText = labelText
        self.labelType = labelType
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        self.text = labelText
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.textAlignment = .left
        self.testForLabelType()
    }
    
    private func testForLabelType() {
        
        switch labelType {
        case .title:
            setupTitle()
        case .subtitle:
            setupSubtitle()
        }
        
    }
    
    private func setupTitle(){
        self.font = .boldSystemFont(ofSize: 24)
        self.textColor = .black
        
    }
    
    private func setupSubtitle(){
        self.font = .systemFont(ofSize: 16)
        self.textColor = .gray
    }
    
}
