//
//  MarvelHeroesDetailViewModel.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 09/05/23.
//

import Foundation

class MarvelHeroesDetailViewModel {
    
    private var myHeroeDetail: Result?
    
    var heroDetail: Result? {
        myHeroeDetail
    }
    
    var imageDetailHero: URL? {
        return URL(string: "\(myHeroeDetail?.thumbnail?.path ?? "").\(myHeroeDetail?.thumbnail?.thumbnailExtension?.rawValue ?? "")")
    }
    
    var nameHero: String {
        return myHeroeDetail?.name ?? ""
    }
    
    var descripitionHero: String {
        return myHeroeDetail?.description ?? ""
    }
    
    var modifiedHero: String {
        return myHeroeDetail?.modified ?? ""
    }
    
    func detailHero(detail: Result?) {
        self.myHeroeDetail = detail
    }
}
