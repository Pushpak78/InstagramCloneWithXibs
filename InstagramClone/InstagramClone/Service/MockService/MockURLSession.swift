//
//  MockURLSession.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

class MockURLSession: URLSession {

    var data: Data?
    var error: Error?
    var response : URLResponse?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskMock {
        
        let data = self.data
        let error = self.error
        let response = self.response
        let urlmock = URLSessionDataTaskMock {
            
            completionHandler(data, response, error)
        }
        return urlmock
    }
}
