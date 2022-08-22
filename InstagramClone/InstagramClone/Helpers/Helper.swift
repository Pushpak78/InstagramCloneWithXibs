//
//  Help.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 19/08/22.
//

import UIKit

struct Helper {
    
    static let userPostList = [UserPost(name: "Mike",
                                    imageName: "Image1",
                                    likesCount: 120,
                                    description: "live the life you deserve chcevcvecvwbwvcwcewhvehvbrhfwiefhwefefvwegvfhwevfuwef"),
                               UserPost(name: "Daniel",
                                        imageName: "Image2",
                                        likesCount: 20,
                                        description: "life is a bliss fwywhcbwbcgeejbceecg"),
                           
                               UserPost(name: "life_broken",
                                        imageName: "Image3",
                                        likesCount: 130,
                                        description: "life is a peach hvfqegycbejhcbehbchdbcevc"),
                               UserPost(name: "Crystal",
                                        imageName: "Image4",
                                        likesCount: 100,
                                        description: "life is tao cvetygcervcehcbehvceicbdev"),
                               UserPost(name: "sanjay",
                                        imageName: "Image1",
                                        likesCount: 90,
                                        description: "life is dao bcuefyte3vev3ueuwguywvqw"),
                               UserPost(name: "lost_soul",
                                        imageName: "Image2",
                                        likesCount: 120,
                                        description: "life is nothing cfweticgwhvcwecjhewv"),
                               UserPost(name: "rider",
                                        imageName: "Image4",
                                        likesCount: 50,
                                        description: "er")]
    
    static func createMockDataForUserPostList() -> Data? {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let postJsonData = try? encoder.encode(Helper.userPostList)
        print(String(data: postJsonData!, encoding: .utf8)!)
        return postJsonData
    }
    
    static func createURLResponseCode200(for endpoint: EndPoint) -> HTTPURLResponse? {
        
        let response = HTTPURLResponse(url: URL(string: endpoint.url)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        return response
    }
    
    static func createURLResponseCode400(for endpoint: EndPoint) -> HTTPURLResponse? {
        
        let response = HTTPURLResponse(url: URL(string: endpoint.url)!, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        return response
    }
}
