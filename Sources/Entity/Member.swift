//
//  Member.swift
//  
//
//  Created by 築山朋紀 on 2021/04/11.
//

import Foundation

public struct Member: Codable {
    let id: Int
    let screenId: String
    
    public init(id: Int, screenId: String) {
        self.id = id
        self.screenId = screenId
    }
}
