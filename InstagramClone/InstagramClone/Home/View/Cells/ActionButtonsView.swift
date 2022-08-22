//
//  ActionButtonsView.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 18/08/22.
//

import UIKit

class ActionButtonsView: UIView {
    
    private let likeButton: UIButton = {
        
        let button = UIButton()
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let commentsButton: UIButton = {
       
        let button = UIButton()
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sendButton: UIButton = {
        
        let button = UIButton()
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    private let saveButton: UIButton = {
        
       let button = UIButton()
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .trailing
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        return button
    }()
    
    private let primaryStackview: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let secondaryStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addLayoutConstraints()
    }
}

//MARK: Layout constraints
extension ActionButtonsView {
    
     func addLayoutConstraints() {
         
         addSubview(primaryStackview)
         primaryStackview.addArrangedSubview(likeButton)
         primaryStackview.addArrangedSubview(commentsButton)
         primaryStackview.addArrangedSubview(sendButton)
         primaryStackview.addArrangedSubview(saveButton)
         
         NSLayoutConstraint.activate([
         
            primaryStackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            primaryStackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            primaryStackview.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -2),
            primaryStackview.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0),
            
            likeButton.widthAnchor.constraint(equalToConstant: 40.0),
            likeButton.heightAnchor.constraint(equalToConstant: 40.0),
            commentsButton.widthAnchor.constraint(equalToConstant: 40.0),
            commentsButton.heightAnchor.constraint(equalToConstant: 40.0),
            sendButton.widthAnchor.constraint(equalToConstant: 40.0),
            sendButton.heightAnchor.constraint(equalToConstant: 40.0),
            saveButton.widthAnchor.constraint(equalToConstant: 40.0),
            saveButton.heightAnchor.constraint(equalToConstant: 40.0),
            saveButton.trailingAnchor.constraint(equalTo: primaryStackview.trailingAnchor)
         ])
         saveButton.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
