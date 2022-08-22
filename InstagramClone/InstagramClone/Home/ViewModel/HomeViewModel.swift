//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

class HomeViewModel {
    
    var homeService: HomeService? = nil
    var userData = ""
    var userId = ""
    var userPostList : [UserPost] = []
    
    
    func getUserPostDataList (completion: @escaping () -> Void) {
        
        if homeService == nil {
            
            homeService = HomeService(session: URLSession(configuration: .default))
        }
        userId = "1234"
        homeService!.getUserPostData(userId: userId){ [weak self] ( result, error) in
            
            
            if error == nil {
                
                if let postList = result as? [UserPost] {
                    
                    self?.userPostList = postList
                }
            } else {
                
                print((error as? String)!)
            }
            completion()
        }
    }
    
    func postUserData(completion: @escaping () -> Void) {
        
        completion()
    }
    
    func getHomeViewControllerRelatedData(completion: @escaping () -> Void) {
        
        let group = DispatchGroup()
        
        group.enter()
        
        getUserPostDataList {
            group.leave()
        }
        
        group.enter()
        
        postUserData {
            group.leave()
        }
        
        group.notify(queue: .main) {
            
            completion()
        }
    }
}

