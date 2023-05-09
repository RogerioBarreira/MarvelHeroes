//
//  MarvelHeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 06/05/23.
//

import UIKit

class MarvelHeroesListViewController: UIViewController {
    
    lazy var viewMarvelHeroesList: MarvelHeroesListView = {
        let view = MarvelHeroesListView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let viewModel = MarvelHeroesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "List Heroes"
        setupRequest()
    }
    
    override func loadView() {
        self.view = viewMarvelHeroesList
    }
    
    func setupRequest() {
        viewModel.requestCharacterViewModel { success in
            if success {
                print(success)
            } else {
                print("Erro request")
            }
        }
    }
}
