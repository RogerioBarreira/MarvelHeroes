//
//  MarvelHeroesListViewModel.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 06/05/23.
//

import Foundation

class MarvelHeroesListViewModel: NSObject {
    
    private var charac: Character?
    private let worker = Worker()
    
    var numberOfItens: Int {
        return charac?.data?.results?.count ?? 0
    }
    
    func cellForItens(indexPath: IndexPath)-> Result? {
        return charac?.data?.results?[indexPath.item]
    }
    
    func requestCharacterViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerEpisode { [weak self] myChar, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.charac = myChar
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
