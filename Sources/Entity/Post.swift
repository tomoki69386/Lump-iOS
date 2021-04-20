//
//  Post.swift
//  
//
//  Created by 築山朋紀 on 2021/04/11.
//

import Foundation

public struct Post: Codable {
    public let id: Int
    public let memberId: Int
    public let content: String
    public let imageUrls: [URL]
    public let mediaType: MediaType
    
    public init(id: Int, memberId: Int, content: String, imageUrls: [URL], mediaType: MediaType) {
        self.id = id
        self.memberId = memberId
        self.content = content
        self.imageUrls = imageUrls
        self.mediaType = mediaType
    }
}
