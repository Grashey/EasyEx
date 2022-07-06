//
//  Assembly.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class Assembly: iAssembly {
    
    func build(_ moduleName: ModuleName) -> UIViewController {
        switch moduleName {
        case .search: return SearchAssembly().build()
        case .favorites: return UIViewController()
        }
    }
}
