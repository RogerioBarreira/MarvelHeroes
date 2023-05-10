//
//  MarvelHeroesListViewModel.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 06/05/23.
//

import Foundation

class MarvelHeroesListViewModel: NSObject {
    
    private var charac: [Result] = []
    private let worker = Worker()
    var requestLoad = false
    var totalCharacter = 0
    var currentPage = 1
    
    var addCharac: [Result] {
        return charac
    }
    
    var numberOfItens: Int {
        return charac.count
    }
    
    func addPage() {
        currentPage += 1
    }
    
    func cellForItens(indexPath: IndexPath)-> Result? {
        return charac[indexPath.item]
    }
    
    func requestCharacterViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerEpisode { [weak self] myChar, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.charac = myChar?.data?.results ?? []
                completion(true)
            case false:
                completion(false)
            }
        }
    }
    
    func requestAddCharacterViewModel(completion: @escaping (Bool)-> Void) {
        requestLoad = true
        worker.workerEpisode(page: currentPage) { [weak self] newCharacter, success in
            guard let self = self else { return }
            switch success {
            case true:
                if let newCharac = newCharacter {
                    self.charac.append(contentsOf: newCharac.data?.results ?? [])
                    self.totalCharacter = newCharac.data?.total ?? 0
                }
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
