//
//  MarvelHeroDetailNetworkViewController.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 10/05/23.
//

import UIKit
import WebKit

class MarvelHeroDetailNetworkViewController: UIViewController {
    
    lazy var viewMarvelHeroDetailNetwork: MarvelHeroDetailNetworkView = {
        let view = MarvelHeroDetailNetworkView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let viewModelMarvelHeroDetailNetwork = MarvelHeroDetailNetworkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = viewModelMarvelHeroDetailNetwork.nameHeroDetail
        setupURL()
        setupWebView()
    }
    
    override func loadView() {
        self.view = viewMarvelHeroDetailNetwork
    }
    
    func setupWebView() {
        viewMarvelHeroDetailNetwork.webView.navigationDelegate = self
    }
    
    func setupURL() {
        viewMarvelHeroDetailNetwork.loading.startAnimating()
        self.viewMarvelHeroDetailNetwork.webView.allowsBackForwardNavigationGestures = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: self.viewModelMarvelHeroDetailNetwork.urlHero) else { return }
            DispatchQueue.main.async {
                self.viewMarvelHeroDetailNetwork.webView.load(URLRequest(url: url))
            }
        }
    }
}

extension MarvelHeroDetailNetworkViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.viewMarvelHeroDetailNetwork.loading.stopAnimating()
        }
    }
}
