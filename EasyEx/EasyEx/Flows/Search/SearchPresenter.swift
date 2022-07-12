//
//  SearchPresenter.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import Foundation

protocol iSearchPresenter {
    
    var result: [Security] { get }
    func search(_ value: String)
    func clear()
}

class SearchPresenter: iSearchPresenter {
    
    weak var viewController: SearchViewController?
    private let networkService: iSearchNetworkService
    var result: [Security] = []
    
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
    
    func clear() {
        result = []
        viewController?.reloadView()
    }
}
