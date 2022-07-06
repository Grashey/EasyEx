//
//  Route.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iRoute {
    var method: String { get }
    var url: String { get }
    var baseURL: String { get }
    var parameters: [String: String] { get }
    
    func makeURL() -> String
}

extension iRoute {
    var baseURL: String { NetworkUrl.baseUrl }
    var method: String { "GET" }
    var parameters: [String: String] { [:] }

    func makeURL() -> String {
       baseURL.appending(url)
    }
}
