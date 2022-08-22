//
//  CircleCollectionViewCell.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CircleCollectionViewCell"
    
    private let circleImage: UIImageView = {
        
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleAspectFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 100.0/2.0
        return imageview
    }()
    
    private let circleName: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body, compatibleWith: nil)
        label.textColor = .black
        label.contentMode = .center
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        contentView.addSubview(circleImage)
        contentView.addSubview(circleName)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addLayout()
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
    }
    
    func setUp(name: String, imageName: String) {
        
        circleImage.image = UIImage(named: imageName)
        circleName.text = name
    }
}

//MARK: Layout constraints
extension CircleCollectionViewCell {
    
    func addLayout() {
        
        NSLayoutConstraint.activate([
            
            circleImage.topAnchor.constraint(equalTo: topAnchor),
            circleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            circleName.topAnchor.constraint(equalToSystemSpacingBelow: circleImage.bottomAnchor, multiplier: 1),
            circleName.centerXAnchor.constraint(equalTo: centerXAnchor),
           //circleName.trailingAnchor.constraint(equalTo: circleImage.trailingAnchor),
           //circleName.leadingAnchor.constraint(equalTo: circleImage.leadingAnchor),
            circleImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
