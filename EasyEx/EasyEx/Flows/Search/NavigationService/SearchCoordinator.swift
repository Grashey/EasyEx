//
//  SearchCoordinator.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class SearchCoordinator: iCoordinator {

    private var navigationController: UINavigationController
    private var vcAssembly: iAssembly

    init(navigationController: UINavigationController, vcAssembly: iAssembly) {
        self.navigationController = navigationController
        self.vcAssembly = vcAssembly
    }

    func start() {
        guard let controller = vcAssembly.build(.search) as? SearchViewController else { return }
        navigationController.viewControllers = [controller]
    }
}
