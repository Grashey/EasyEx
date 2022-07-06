//
//  SearchPresenter.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iSearchPresenter {
    
    var result: [[String]] { get }
    func search(_ value: String)
}

class SearchPresenter: iSearchPresenter {
    
    weak var viewController: SearchViewController?
    private let networkService: iSearchNetworkService
    var result: [[String]] = []
    
    init(networkService: iSearchNetworkService) {
        self.networkService = networkService
    }
    
    func search(_ value: String) {
        networkService.search(value: value) { [weak self] result in
            
            switch result {
            case .success(let data):
                self?.result = data.securities.data
                DispatchQueue.main.async {
                    self?.viewController?.reloadView()
                }
            case .failure(let error): print(error)
            }
        }
    }
}
