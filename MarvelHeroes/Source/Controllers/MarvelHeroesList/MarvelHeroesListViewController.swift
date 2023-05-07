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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Marvel Heroes List"
    }
    
    override func loadView() {
        self.view = viewMarvelHeroesList
    }
}
