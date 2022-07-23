//
//  iAssembly.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

protocol iAssembly {
    func build(_ moduleName: ModuleName) -> UIViewController
}
