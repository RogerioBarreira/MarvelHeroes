//
//  Worker.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 07/05/23.
//

import Foundation
import CryptoSwift

class Worker {
    
    private let request = RequestGenerics()
    private var myCharacter: Character?
    
    func workerEpisode(page: Int = 0, completion: @escaping (Character?, Bool)-> Void) {
        let limit = 50
        let offset = page * limit
        let ts = Date().timeIntervalSince1970.description
        guard let privateKey = Bundle.main.object(forInfoDictionaryKey: "PRIVATE_KEY") as? String else { return }
        guard let publicKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let url = "\(ApiServices.basePath)limit=\(limit)&offset=\(offset)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        request.requestGenerics(urlString: url, method: .get, custom: Character.self) { [weak self] myCharacter, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myCharacter = myCharacter
                completion(myCharacter,true)
            case false:
                completion(nil,false)
            }
        }
    }
}
