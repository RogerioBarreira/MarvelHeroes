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
    
    var nameHero: String {
        return charac?.data?.results?.first?.name ?? ""
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
