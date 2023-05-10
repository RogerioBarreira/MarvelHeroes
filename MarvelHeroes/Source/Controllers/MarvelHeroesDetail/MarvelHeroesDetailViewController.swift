//
//  MarvelHeroesDetailViewController.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 09/05/23.
//

import UIKit
import Kingfisher

class MarvelHeroesDetailViewController: UIViewController {
    
    lazy var viewMarvelHeroesDetail: MarvelHeroesDetailView = {
        let view = MarvelHeroesDetailView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let viewModelMarvelHeroesDetail = MarvelHeroesDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = viewModelMarvelHeroesDetail.nameHero
        setupUI()
        setupButton()
    }
    
    override func loadView() {
        self.view = viewMarvelHeroesDetail
    }
    
    func setupUI() {
        setupImageDetail()
        setupNameHero()
        setupDescriptionHero()
    }
    
    func setupImageDetail() {
        viewMarvelHeroesDetail.imageDetail.kf.setImage(with: viewModelMarvelHeroesDetail.imageDetailHero)
    }
    
    func setupNameHero() {
        viewMarvelHeroesDetail.labelNameHero.text = viewModelMarvelHeroesDetail.nameHero
    }
    
    func setupDescriptionHero() {
        viewMarvelHeroesDetail.labelDescription.text = viewModelMarvelHeroesDetail.descripitionHero
    }
    
    func setupButton() {
        viewMarvelHeroesDetail.buttonNext.addTarget(
            self,
            action: #selector(buttonNextDetail),
            for: .touchUpInside
        )
    }
    
    @objc
    func buttonNextDetail() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startMarvelHeroesDetailNetwork(detail: viewModelMarvelHeroesDetail.heroDetail)
    }
}
