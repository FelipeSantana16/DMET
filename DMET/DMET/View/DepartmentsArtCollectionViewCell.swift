//
//  DepartmentsArtCollectionViewCell.swift
//  DMET
//
//  Created by Felipe Santana on 23/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class DepartmentsArtCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DepartmentsArtCollectionViewCell"
    
    let imageView = UIImageView()
    let background = UIView()
    let artName = UILabel()
    let artYear = UILabel()
    
    
    public func configure(name: String, year: String, image: UIImage) {
        
        imageView.image = image
        artName.text = name
        artYear.text = year
        
        setupImage()
        setupBackground()
        setupArtName()
        setupArtYear()
        
    }
    
    func setupImage() {
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 313).isActive = true
    }
    
    func setupBackground() {
        
        addSubview(background)
        
        background.backgroundColor = UIColor(displayP3Red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        background.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setupArtName() {
        
        addSubview(artName)
        
        artName.numberOfLines = 0
        artName.adjustsFontSizeToFitWidth = true
        artName.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        artName.textColor = .white
        artName.textAlignment = .center
        
        artName.translatesAutoresizingMaskIntoConstraints = false
        
        artName.topAnchor.constraint(equalTo: background.topAnchor, constant: 16).isActive = true
        
        artName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        artName.leadingAnchor.constraint(greaterThanOrEqualTo: background.leadingAnchor, constant: 2).isActive = true
        
        artName.trailingAnchor.constraint(greaterThanOrEqualTo: background.trailingAnchor, constant: -2).isActive = true
    }
    
    func setupArtYear() {
        
        addSubview(artYear)
        
        artYear.numberOfLines = 0
        artYear.adjustsFontSizeToFitWidth = true
        artYear.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        artYear.textColor = .white
        
        artYear.translatesAutoresizingMaskIntoConstraints = false
        
        artYear.topAnchor.constraint(equalTo: artName.bottomAnchor, constant: 8).isActive = true
        
        artYear.centerXAnchor.constraint(equalTo: artName.centerXAnchor).isActive = true
        
    }
    
}
