//
//  URLSessionDataTaskMock.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

class URLSessionDataTaskMock: URLSessionDataTask {
    
    var closure: () -> Void

    init(closure: @escaping () -> Void) {
        
        self.closure = closure
    }
    
    override func resume() {
        
        closure()
    }
}
