//
//  ProductTableViewCell.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 25/09/22.
//

import UIKit

// MARK: - Setup custom table view cell
class ProductTableViewCell: UITableViewCell {
    
    var productData: Product? {
        didSet {
            guard let productItem = self.productData else {
                return
            }
            if let name = productItem.productName, let price = productItem.productPrice, let images = productItem.productImages {
                self.nameLabel.text = name
                self.priceLabel.text = price
                for image in images {
                    self.imageStackView.addArrangedSubview(image)
                    image.contentMode = .scaleAspectFit
                    image.layer.cornerRadius = 10
                    image.layer.borderWidth = 1
                    image.layer.borderColor = CGColor(red: 180/273, green: 160/273, blue: 150/273, alpha: 1)
                    image.clipsToBounds = true
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerStackView)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var nameLabel: ReusableLabel = {
        let label = ReusableLabel(labelText: productData?.productName ?? "no name", labelType: .title)
        return label
    }()
    
    private lazy var priceLabel: ReusableLabel = {
        let label = ReusableLabel(labelText: productData?.productPrice ?? "no price", labelType: .subtitle)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 150),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
        return label
    }()
    
    private lazy var imageStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.spacing = 10
        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        NSLayoutConstraint.activate([
            stackV.heightAnchor.constraint(equalToConstant: 150)
        ])
        return stackV
    }()
    
    private lazy var containerStackView: ReusableStackView = {
        let stackV = ReusableStackView(spacingValue: 10, subView: [nameLabel, priceLabel, imageStackView], axisValue: .vertical, distributionValue: .fill)
        stackV.alignment = .leading
        return stackV
    }()
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            containerStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            containerStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            containerStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15)
        ])
    }
}
