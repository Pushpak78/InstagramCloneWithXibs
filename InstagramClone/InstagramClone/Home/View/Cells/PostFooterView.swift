//
//  PostFooterView.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 18/08/22.
//

import UIKit

class PostFooterView: UIView {
    
    private let actionButtonsView: ActionButtonsView = {
        
        let buttonsView = ActionButtonsView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsView
    }()
    
    private let postDescriptionView: PostDescriptionView = {
        
        let descripView = PostDescriptionView()
        descripView.translatesAutoresizingMaskIntoConstraints = false
        return descripView
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
        
        postDescriptionView.setUp(count: count, description: description)
    }
}

//MARK: Layout contraints

extension PostFooterView {
    
    func addLayoutConstraints() {
        
        addSubview(actionButtonsView)
        addSubview(postDescriptionView)
        
        NSLayoutConstraint.activate([
        
            actionButtonsView.topAnchor.constraint(equalTo: topAnchor),
            actionButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            postDescriptionView.topAnchor.constraint(equalToSystemSpacingBelow: actionButtonsView.bottomAnchor, multiplier: 1),
            postDescriptionView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            postDescriptionView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -1 ),
            postDescriptionView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -1)
        ])
    }
}
