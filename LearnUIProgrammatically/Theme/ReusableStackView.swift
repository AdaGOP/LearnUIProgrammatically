//
//  ReusableStackView.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 19/09/22.
//

import UIKit

class ReusableStackView: UIStackView {
    
    enum axisEnum {
        case horizontal, vertical
    }
    
    enum distributionEnum {
        case fillProportionally, fill
    }
    
    public private(set) var spacingValue: CGFloat
    public private(set) var subView: [UIView]
    public private(set) var axisValue: axisEnum
    public private(set) var distributionValue: distributionEnum
    
    init(spacingValue: CGFloat, subView: [UIView], axisValue: axisEnum, distributionValue: distributionEnum) {
        self.spacingValue = spacingValue
        self.subView = subView
        self.axisValue = axisValue
        self.distributionValue = distributionValue
        super.init(frame: .zero)
        self.setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.spacing = spacingValue
        for view in subView {
            self.addArrangedSubview(view)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.testAxisValue()
        self.testDistributionValue()
        
    }
    
    private func testAxisValue() {
        switch axisValue {
        case .horizontal:
            self.axis = .horizontal
        case .vertical:
            self.axis = .vertical
        }
    }
    
    private func testDistributionValue() {
        switch distributionValue {
        case .fillProportionally:
            self.distribution = .fillProportionally
        case .fill:
            self.distribution = .fill
        }
    }
    
}
