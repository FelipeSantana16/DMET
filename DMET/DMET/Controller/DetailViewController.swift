//
//  DetailViewController.swift
//  DMET
//
//  Created by Felipe Santana on 23/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let image = UIImageView()
    let artTitle = UILabel()
    let year = UILabel()
    let dismissButton = UIButton()
    let artistName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func configure(image: UIImage, title: String, year: String, artist: String) {
        
        self.image.image = image
        self.artTitle.text = title
        self.year.text = year
        self.artistName.text = artist
        
        configureImage()
        configureArtTitle()
        configureYear()
        configureArtistName()
    }
    
    func configureImage() {
        view.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                
        image.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        image.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func configureArtTitle() {
        view.addSubview(artTitle)
        
        artTitle.numberOfLines = 0
        artTitle.adjustsFontSizeToFitWidth = true
        artTitle.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        artTitle.textColor = .white
        
        artTitle.translatesAutoresizingMaskIntoConstraints = false
        
        artTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
        
        artTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func configureYear() {
        view.addSubview(year)
        
        year.numberOfLines = 0
        year.adjustsFontSizeToFitWidth = true
        year.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        year.textColor = .white
        
        year.translatesAutoresizingMaskIntoConstraints = false
        
        year.topAnchor.constraint(equalTo: artTitle.bottomAnchor, constant: 8).isActive = true
        year.centerXAnchor.constraint(equalTo: artTitle.centerXAnchor).isActive = true
        
    }
    
    func configureArtistName() {
        view.addSubview(artistName)
        
        artistName.numberOfLines = 0
        artistName.adjustsFontSizeToFitWidth = true
        artistName.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        artistName.textColor = .white
        
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 4).isActive = true
        artistName.centerXAnchor.constraint(equalTo: year.centerXAnchor).isActive = true
        //artistName.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 4).isActive = true
        
    }
    
}
