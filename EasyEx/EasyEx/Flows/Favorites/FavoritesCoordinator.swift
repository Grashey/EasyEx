//
//  FavoritesCoordinator.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 23.07.2022.
//

import UIKit

class FavoritesCoordinator: iCoordinator {

    private var navigationController: UINavigationController
    private var vcAssembly: iAssembly

    init(navigationController: UINavigationController, vcAssembly: iAssembly) {
        self.navigationController = navigationController
        self.vcAssembly = vcAssembly
    }

    func start() {
        let controller = UIViewController()
        controller.title = "Favorites"
        controller.view.backgroundColor = .white
        navigationController.viewControllers = [controller]
    }
}
