//
//  BaseService.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

class BaseService {
    
    var session : URLSession!
    
    static let successStatusCodesRange = 199...299
    
    init(session: URLSession) {
        
        self.session = session
    }
    
    func executeRequest(endpoint : EndPoint, completion: @escaping ((_ result : Data?, _ error : String?) -> Void)) {
        
        guard let url = URL(string: endpoint.url) else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        if let httpBody = endpoint.body {
            
            request.httpBody = httpBody
        }
        request.allHTTPHeaderFields = endpoint.headers
        
        let webTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                
                completion(nil, error?.localizedDescription ?? "Error!")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            let statusCode = httpResponse.statusCode
            
            guard BaseService.successStatusCodesRange.contains(statusCode) else {
                
                completion(nil,"Recieved \(statusCode) from server")
                return
            }
                
            completion(data ,nil)
        })
        
        webTask.resume()
    }
}
 


