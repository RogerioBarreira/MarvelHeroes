//
//  MarvelHeroDetailNetworkViewModel.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 10/05/23.
//

import Foundation

class MarvelHeroDetailNetworkViewModel {
    
    private var heroDetail: Result?
    
    var urlHero: String {
        return heroDetail?.urls?.first?.url ?? ""
    }
    
    var nameHeroDetail: String {
        return heroDetail?.name ?? ""
    }
    
    func detailHero(detail: Result?) {
        self.heroDetail = detail
    }
}
