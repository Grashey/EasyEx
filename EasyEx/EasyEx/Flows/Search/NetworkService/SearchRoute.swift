//
//  SearchRoute.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

enum SearchRoute {
    case search
}

extension SearchRoute: iRoute {
    
    var url: String {
        switch self {
        case .search:
            return NetworkUrl.securities
        }
    }
    
    var parameters: [String : String] {
        ["q" : "",
         "iss.meta" : "off",
         "securities.columns" : "secid, name",
         "is_trading" : "1",
         "group_by" : "group",
         "group_by_filter" : "stock_shares"]
    }
}
