//
//  PostDescriptionView.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 18/08/22.
//

import UIKit

class PostDescriptionView: UIView {
    
    private let likesLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title2).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postDescriptionLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addLayoutConstraints()
    }
    
    func setUp(count: Int, description: String) {
        
        self.likesLabel.text = "\(count) Likes"
        self.postDescriptionLabel.text = description
    }
}

//MARK: layout constraints

extension PostDescriptionView {
    
    func addLayoutConstraints() {
        
        addSubview(likesLabel)
        addSubview(postDescriptionLabel)
        
        NSLayoutConstraint.activate([
        
            likesLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            likesLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            likesLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -2),
            
            postDescriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: likesLabel.bottomAnchor, multiplier: 1),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: likesLabel.leadingAnchor),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            postDescriptionLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -2),
        ])
    }
}
