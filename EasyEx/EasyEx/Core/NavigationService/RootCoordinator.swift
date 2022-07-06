//
//  RootCoordinator.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class RootCoordinator: iCoordinator {

    let window: UIWindow?
    lazy var tabBarCoordinator = TabBarCoordinator(window: window)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        tabBarCoordinator.start()
    }

}
