//
//  Coordinator.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 06/05/23.
//

import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func startMarvelHeroesList() {
        let viewController = MarvelHeroesListViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
