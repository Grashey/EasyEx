//
//  TabBarController.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class TabBarController: UITabBarController {

    let searchNavigation = UINavigationController()
    let favoritesNavigation = UINavigationController()
    
    private enum Titles {
        static let search = "Search"
        static let favorites = "Favorites"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchNavigation.tabBarItem = UITabBarItem(title: Titles.search, image: nil, selectedImage: nil)
        favoritesNavigation.tabBarItem = UITabBarItem(title: Titles.favorites, image: nil, selectedImage: nil)

        viewControllers = [searchNavigation, favoritesNavigation]
    }
}
