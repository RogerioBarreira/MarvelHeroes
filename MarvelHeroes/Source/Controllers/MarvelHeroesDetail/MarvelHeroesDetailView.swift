//
//  MarvelHeroesDetailView.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 09/05/23.
//

import UIKit

class MarvelHeroesDetailView: UIView {
    
    let imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.borderColor = UIColor.systemRed.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    let labelNameHero: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .justified
        label.textColor = .white
        return label
    }()
    
    let buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Detail Heroes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .red
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupImageDetail()
        setupNameHero()
        setupDescriptionHero()
        setupButtonNext()
    }
    
    private func setupImageDetail() {
        addSubview(imageDetail)
        NSLayoutConstraint.activate([
            imageDetail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageDetail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageDetail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageDetail.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func setupNameHero() {
        addSubview(labelNameHero)
        NSLayoutConstraint.activate([
            labelNameHero.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 20),
            labelNameHero.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelNameHero.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            labelNameHero.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupDescriptionHero() {
        addSubview(labelDescription)
        NSLayoutConstraint.activate([
            labelDescription.topAnchor.constraint(equalTo: labelNameHero.bottomAnchor, constant: 5),
            labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            labelDescription.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupButtonNext() {
        addSubview(buttonNext)
        NSLayoutConstraint.activate([
            buttonNext.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            buttonNext.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            buttonNext.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonNext.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
