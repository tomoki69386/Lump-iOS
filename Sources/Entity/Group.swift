//
//  File.swift
//
//
//  Created by 築山朋紀 on 2021/04/20.
//

import Foundation

public struct Group: Codable {
  public var id: Int
  public var name: String

  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}
