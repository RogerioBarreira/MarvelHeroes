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
    
    func startMarvelHeroesDetail(detail: Result?) {
        let viewController = MarvelHeroesDetailViewController()
        viewController.viewModelMarvelHeroesDetail.detailHero(detail: detail)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startMarvelHeroesDetailNetwork(detail: Result?) {
        let viewController = MarvelHeroDetailNetworkViewController()
        viewController.viewModelMarvelHeroDetailNetwork.detailHero(detail: detail)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
