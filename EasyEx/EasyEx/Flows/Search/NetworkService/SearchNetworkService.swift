//
//  SearchNetworkService.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iSearchNetworkService {
    func search(value: String, completion: @escaping (Result<SearchResponse, Error>) -> Void)
}

class SearchNetworkService: iSearchNetworkService {

    private let requestBuilder: iRequestBuilder
    private let httpClient: iHTTPClient

    init (requestBuilder: iRequestBuilder, httpClient: iHTTPClient) {
        self.requestBuilder = requestBuilder
        self.httpClient = httpClient
    }

    func search(value: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        let request = requestBuilder.makeRequest(route: SearchRoute.search, engines: nil, markets: nil, boards: nil, securities: value)
        httpClient.request(request: request, completion: completion)
    }
}
