//
//  PostHeaderView.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

class PostHeaderView: UIView {
    
    static let postImageHeight = 30.0
    
    private let headerStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    private let postImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = PostHeaderView.postImageHeight/2.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let postName: UILabel = {
        
        let name = UILabel()
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let optionsButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "threedots"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addStyle()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addLayoutConstraints()
    }
    
    func setUp(name: String, imageName: String) {
        
        postImage.image = UIImage(named: imageName)
        postName.text = name
    }
}

//MARK: layout and styles
extension PostHeaderView: UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
    }
    
    func addLayoutConstraints() {
        
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(postImage)
        headerStackView.addArrangedSubview(postName)
        headerStackView.addArrangedSubview(optionsButton)
        
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1 ),
            headerStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            postImage.widthAnchor.constraint(equalToConstant: 30.0),
            postImage.heightAnchor.constraint(equalToConstant: 30.0),
            
            optionsButton.widthAnchor.constraint(equalToConstant: 40.0),
            optionsButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        postName.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
