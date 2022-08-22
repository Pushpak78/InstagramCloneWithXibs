//
//  BaseClassViewController.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

class BaseClassViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        //For BaseClass, No common intialisation is required
    }
    
    func setTabBarImage(title: String,imageName: String) {
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        tabBarItem.standardAppearance?.selectionIndicatorTintColor = .black
    }
}


class SearchViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        title = "Search"
    }
    
    override func commonInit() {
        
        setTabBarImage(title: "Search", imageName: "magnifyingglass")
    }
}

class ReelsViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        //view.backgroundColor = .orange
        title = "Reels"
    }
    
    override func commonInit() {
        
        setTabBarImage(title: "Reels", imageName: "play.tv")
    }
}

class NotificationsViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        //view.backgroundColor = .purple
        title = "Notifications"
    }
    
    override func commonInit() {
        
        setTabBarImage(title: "Notifications", imageName: "heart")
    }
}

class ProfileViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
       // view.backgroundColor = .blue
        title = "Profile"
    }
    
    override func commonInit() {
        
        setTabBarImage(title: "Profile", imageName: "person.circle")
    }
}
