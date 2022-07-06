//
//  TabBarCoordinator.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class TabBarCoordinator {

    var window: UIWindow?
    private let controller = TabBarController()
    private let assembly: iAssembly = Assembly()
    private lazy var searchCoordinator = SearchCoordinator(navigationController: controller.searchNavigation, vcAssembly: assembly)
//    private lazy var favoritesCoordinator = FavoritesCoordinator(navigationController: controller.favoritesNavigation)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        window?.rootViewController = controller
        searchCoordinator.start()
//        favoritesCoordinator.start()
    }
}
