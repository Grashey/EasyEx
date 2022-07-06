//
//  SearchResponse.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

struct SearchResponse: Codable {
    
    let securities: SearchData

    struct SearchData: Codable {
        let columns: [String]
        let data: [[String]]
    }
}
