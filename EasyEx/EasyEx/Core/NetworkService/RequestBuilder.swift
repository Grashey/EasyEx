//
//  RequestBuilder.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iRequestBuilder {
    func makeRequest(route: iRoute, engines: String?, markets: String?, boards: String?, securities: String) -> URLRequest
}

class RequestBuilder: iRequestBuilder {

    func makeRequest(route: iRoute, engines: String?, markets: String?, boards: String?, securities: String) -> URLRequest {
        var components = URLComponents(string: route.makeURL())

        var items: [URLQueryItem] = []
        route.parameters.forEach {
            let value = ($0.key == "q") ? securities : $0.value
            items.append(URLQueryItem(name: $0.key, value: value))
        }
        components?.queryItems = items

        if let url = components?.url {
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
            request.httpMethod = route.method
            return request
        }
        return URLRequest(url: URL(fileURLWithPath: ""))
    }
}
