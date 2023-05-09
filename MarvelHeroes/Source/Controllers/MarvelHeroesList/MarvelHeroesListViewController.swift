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
        setupCollectionView()
        setupRequest()
    }
    
    override func loadView() {
        self.view = viewMarvelHeroesList
    }
    
    func setupCollectionView() {
        self.viewMarvelHeroesList.collectionView.delegate = self
        self.viewMarvelHeroesList.collectionView.dataSource = self
    }
    
    func setupRequest() {
        viewMarvelHeroesList.loading.startAnimating()
        viewModel.requestCharacterViewModel { [weak self] success in
            guard let self = self else { return }
            self.viewMarvelHeroesList.loading.stopAnimating()
            if success {
                self.viewMarvelHeroesList.collectionView.reloadData()
            } else {
                print("Erro request")
            }
        }
    }
}

extension MarvelHeroesListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = viewMarvelHeroesList.collectionView.dequeueReusableCell(withReuseIdentifier: MHCharacterCollectionViewCell.identifier, for: indexPath) as? MHCharacterCollectionViewCell {
     
            cell.setupCell(hero: viewModel.cellForItens(indexPath: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == viewModel.addCharac.count - 10 && indexPath.item != viewModel.totalCharacter {
            
            viewModel.addPage()
            self.viewMarvelHeroesList.loading.startAnimating()
            viewModel.requestAddCharacterViewModel { [weak self] success in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.viewMarvelHeroesList.loading.stopAnimating()
                }
                switch success {
                case true:
                    self.viewModel.requestLoad = false
                    self.viewMarvelHeroesList.collectionView.reloadData()
                    print("total de paginas add: \(self.viewModel.currentPage)")
                case false:
                    print("Erro ao add Hero")
                }
            }
        }
    }
}
