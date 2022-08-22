//
//  PostTableViewCell.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let postHeaderView: PostHeaderView = {
        
        let header = PostHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        return header
    }()
    
    private let postImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false 
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let postFooterView: PostFooterView = {
        
        let footer = PostFooterView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.backgroundColor = .clear
        return footer
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addLayoutConstraints()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    func setUp(name: String, imageName: String, count: Int, description: String) {
        
        postImageView.image = UIImage(named: imageName)
        postHeaderView.setUp(name: name, imageName: imageName)
        postFooterView.setUp(count: count, description: description)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        postImageView.image = nil
    }
}

//MARK: layout and styles

extension PostTableViewCell {

    func addLayoutConstraints() {
        
        contentView.addSubview(postHeaderView)
        contentView.addSubview(postImageView)
        contentView.addSubview(postFooterView)
        
        NSLayoutConstraint.activate([
        
            postHeaderView.topAnchor.constraint(equalTo: topAnchor),
            postHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            postImageView.topAnchor.constraint(equalToSystemSpacingBelow: postHeaderView.bottomAnchor, multiplier: 1),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            postFooterView.topAnchor.constraint(equalToSystemSpacingBelow: postImageView.bottomAnchor, multiplier: 0),
            postFooterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postFooterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postFooterView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -1)
        ])
    }
}
