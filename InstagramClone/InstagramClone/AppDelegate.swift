//
//  AppDelegate.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        Styles.applyTabBarStyle()
        Styles.applyNavigationBarStyle()
            
        let homeViewModel = HomeViewModel()
        let session = MockURLSession()
        session.data = Helper.createMockDataForUserPostList()
        session.response = Helper.createURLResponseCode200(for: EndPoint.getUserPostsData(userId: "1234"))
        homeViewModel.homeService = HomeService(session: session)
        
        let homeVC = HomeViewController(viewModel: homeViewModel)
        let searchVC = SearchViewController()
        let reelsVC = ReelsViewController()
        let notificationsVC = NotificationsViewController()
        let profileVC = ProfileViewController()
                            
        let homeNC = UINavigationController(rootViewController: homeVC)
        let searchNC = Styles.makeNavigationController(with: searchVC)
        let reelsNC = Styles.makeNavigationController(with: reelsVC)
        let notificationsNC = Styles.makeNavigationController(with: notificationsVC)
        let profileNC = Styles.makeNavigationController(with: profileVC)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, searchNC, reelsNC, notificationsNC, profileNC]

        window?.rootViewController = tabBarController
        
        return true
    }
}

