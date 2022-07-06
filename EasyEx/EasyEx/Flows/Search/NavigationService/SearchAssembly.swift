//
//  SearchAssembly.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class SearchAssembly {
    
    func build() -> UIViewController {
        let controller = SearchViewController()
        let requestBuilder = RequestBuilder()
        let httpClient = HTTPClient()
        let networkService = SearchNetworkService(requestBuilder: requestBuilder, httpClient: httpClient)
        let presenter = SearchPresenter(networkService: networkService)
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }
}
