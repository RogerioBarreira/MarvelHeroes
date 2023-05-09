//
//  MHCharacterCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Rogerio Martins on 09/05/23.
//

import UIKit
import Kingfisher

class MHCharacterCollectionViewCell: UICollectionViewCell {
    
    let imageHero: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let viewNameHero: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    let nameHero: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    static let identifier: String = "MHCharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemRed.cgColor
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupImage()
        setupViewName()
        setupNameHero()
    }
    
    func setupImage() {
        contentView.addSubview(imageHero)
        NSLayoutConstraint.activate([
            imageHero.topAnchor.constraint(equalTo: self.topAnchor),
            imageHero.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageHero.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func setupViewName() {
        contentView.addSubview(viewNameHero)
        NSLayoutConstraint.activate([
            viewNameHero.topAnchor.constraint(equalTo: imageHero.bottomAnchor),
            viewNameHero.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewNameHero.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewNameHero.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewNameHero.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.15)
        ])
    }
    
    func setupNameHero() {
        viewNameHero.addSubview(nameHero)
        NSLayoutConstraint.activate([
            nameHero.leadingAnchor.constraint(equalTo: viewNameHero.leadingAnchor, constant: 10),
            nameHero.trailingAnchor.constraint(equalTo: viewNameHero.trailingAnchor, constant: -10),
            nameHero.centerYAnchor.constraint(equalTo: viewNameHero.centerYAnchor)
        ])
    }
    
    func setupCell(hero: Result?) {
        if let url = URL(string: "\(hero?.thumbnail?.path ?? "").\(hero?.thumbnail?.thumbnailExtension?.rawValue ?? "")") {
            imageHero.kf.indicatorType = .activity
            imageHero.kf.setImage(with: url)
        } else {
            imageHero.image = nil
        }
        nameHero.text = hero?.name ?? ""
    }
}
