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
        
        var spacingValue: CGFloat
        var subView: [UIView]
        var axisValue: axisEnum? {
            didSet {
                testAxisValue()
            }
        }
        var distributionValue: distributionEnum? {
            didSet {
                testDistributionValue()
            }
        }
        
        init(spacingValue: CGFloat, subView: [UIView], axisValue: axisEnum?, distributionValue: distributionEnum?) {
            self.spacingValue = spacingValue
            self.subView = subView
            super.init(frame: .zero)
            self.axisValue = axisValue
            self.distributionValue = distributionValue
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
            default:
                print("none")
            }
        }
        
        private func testDistributionValue() {
            switch distributionValue {
            case .fillProportionally:
                self.distribution = .fillProportionally
            case .fill:
                self.distribution = .fill
            default:
                print("none")
            }
        }

}
