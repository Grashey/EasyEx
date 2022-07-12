//
//  Security.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 12.07.2022.
//

import Foundation

struct Security: Codable {
    let id: String
    let name: String
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        id = try container.decode(String.self)
        name = try container.decode(String.self)
    }
}
