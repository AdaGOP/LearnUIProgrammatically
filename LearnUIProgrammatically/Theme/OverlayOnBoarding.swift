//
//  OverlayOnBoarding.swift
//  LearnUIProgrammatically
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class OverlayOnBoarding: UIView {

    let title: String
    weak var anchorView: UIView?
    var onTap: (() -> Void)?
    
    init(title: String, anchorView: UIView?) {
        self.title = title
        super.init(frame: .zero)
        self.anchorView = anchorView
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.text = title
        titleLabel.textColor = .label
        titleLabel.isHidden = title.isEmpty
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Polygon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 35),
            imageView.heightAnchor.constraint(equalToConstant: 15),
        ])
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        alpha = 0
        
        // TODO
        guard let anchorView = self.anchorView,
              let parentView = anchorView.superview,
              let cloneView  = anchorView.snapshotView(afterScreenUpdates: false) else { return }
        
        let translatedOrigin = parentView.convert(anchorView.frame.origin, to: self)
        cloneView.frame = CGRect(origin: translatedOrigin, size: anchorView.bounds.size)
        
        containerView.addSubview(titleLabel)
        
        addSubview(backgroundView)
        addSubview(cloneView)
        addSubview(containerView)
        addSubview(arrowImage)
        
        let constraints = [
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            arrowImage.centerXAnchor.constraint(equalTo: cloneView.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: cloneView.topAnchor, constant: -20),
            arrowImage.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -1)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapGesture(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onTapGesture(_ sender: Any) {
        onTap?()
    }
    
    func showOverlay() {
        UIView.animate(withDuration: 0.6) {
            self.alpha = 1
        }
    }
    
    func hideOverlay(_ completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.6, animations: {
            self.alpha = 0
        }, completion: completion)
    }
    

}
