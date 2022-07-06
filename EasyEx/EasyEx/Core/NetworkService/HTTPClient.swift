//
//  HTTPClient.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iHTTPClient {

    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, Error>) -> Void)
}

class HTTPClient: iHTTPClient {

    private let session = URLSession(configuration: .default)
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    private let decoder = JSONDecoder()

    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, Error>) -> Void) {

        let handler: Handler = { rawData, _, error in
            if let data = rawData {
                do {
                    let decoded = try self.decoder.decode(ResponseType.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        self.session.dataTask(with: request, completionHandler: handler).resume()
    }
}
