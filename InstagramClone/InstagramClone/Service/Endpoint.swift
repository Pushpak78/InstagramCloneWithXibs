//
//  Endpoint.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
}

public enum EndPoint {
    
    case getUserPostsData(userId: String)
    case postUserData(data: String)

    var method: HTTPMethod {
        
        switch self {
        
        case .getUserPostsData(_):
            return .get
            
        case .postUserData(_):
            return .post
        }
    }
    
    var url: String {
        
        let baseUrl:String = "https://developers.facebook.com/instagram-api/"
        
        switch self {
            
        case .getUserPostsData(let userId):
            return baseUrl + "posts/user/\(userId)"
            
        case .postUserData(_):
            return baseUrl + "create/user/post"
        }
    }
    
    var body: Data? {
        
        switch self {
            
        case .getUserPostsData(let userId):
            return userId.data(using: .utf8)
            
        case .postUserData(let postData):
            return postData.data(using: .utf8)
        }
    }
    
    var headers: [String:String] {
    
        switch self {
            
        case .postUserData(_), .getUserPostsData(_):
            return ["accesstoken" : "618cbaff05c591391ca035ffvtyceiucb363542378vgewvdifr478"]
        }
    }
}

