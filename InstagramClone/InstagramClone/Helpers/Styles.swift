//
//  Styles.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

extension UIFont {
    
    func withTraits(traits : UIFontDescriptor.SymbolicTraits) -> UIFont {
        
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont{
        
        self.withTraits(traits: UIFontDescriptor.SymbolicTraits.traitBold)
    }
}

extension UIColor {
    
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1.0)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1.0)
}

struct Styles {
    
    static func applyTabBarStyle() {
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.0),
                          NSAttributedString.Key.strokeColor : UIColor.black]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        UITabBar.appearance().tintColor = .black
    }

    static func applyNavigationBarStyle(titleColor:UIColor = UIColor.black) {
    
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: titleColor]
        
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    static func makeNavigationController(with rootVC : UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 40, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.label]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
}

protocol UIViewNecessaryMethodsDelegate {
        
    func addStyle()
    func addLayoutConstraints()
}


