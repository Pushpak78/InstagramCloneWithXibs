//
//  HomeService.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

class HomeService {
    
    var baseService: BaseService!
    
    init(session: URLSession) {
        
        baseService = BaseService.init(session: session)
    }
    
    func getUserPostData(userId: String,completionHandler: @escaping (_ result:Any?,_ error:Any?) -> Void) {
        
        baseService.executeRequest(endpoint: EndPoint.getUserPostsData(userId: userId)) { (result, error) in
            
            if error == nil {
                
                do {
                    
                    let userPostDataList = try JSONDecoder().decode([UserPost].self,
                                                                    from: result!)
                    completionHandler(userPostDataList, nil)
                } catch {
                    
                    print("An error occured: \(error)")
                    completionHandler(nil,error.localizedDescription)
                }
            } else {
                
                completionHandler(nil,error ?? "Error!")
            }
        }
    }
    
    func postUserData(userData: String,completionHandler: @escaping (_ message: Any?,_ error:Any?) -> Void) {
        
        baseService.executeRequest(endpoint: EndPoint.postUserData(data: userData)) { (result, error) in
            
            if error == nil {
                
                completionHandler("Success", nil)
            } else {
                
                completionHandler(nil,error ?? "Error!")
            }
        }
    }
}
