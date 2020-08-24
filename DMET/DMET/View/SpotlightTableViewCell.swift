//
//  SpotlightTableViewCell.swift
//  DMET
//
//  Created by Felipe Santana on 20/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class SpotlightTableViewCell: UITableViewCell {

    static let identifier = "SpotlightTableViewCell"
    
    let sectionName = UILabel()
    let sectionLine = UIView()
    let background = UIView()
    let textPlaceHolder = UIView()
    let objectTitle = UILabel()
    let objectYear = UILabel()
    let artistName = UILabel()
    let objectImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        configureSectionName()
        configureSectionLine()
        configureBackground()
        configureTextPlaceHolder()
        configureObjectTitle()
        configureObjectYear()
        configureArtistName()
        configureObjectImage()
    }
    func configureSectionName() {
        sectionName.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        sectionName.numberOfLines = 0
        sectionName.adjustsFontSizeToFitWidth = true
        sectionName.textColor = .white
        sectionName.text = "Spotlight"
        
        addSubview(sectionName)
        setSectionNameConstraints()
    }
    
    func setSectionNameConstraints() {
        
        sectionName.translatesAutoresizingMaskIntoConstraints = false
        sectionName.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        sectionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
    }
    
    func configureSectionLine() {
        addSubview(sectionLine)
        sectionLine.backgroundColor = UIColor(displayP3Red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        setSectionLineConstraints()
    }
    
    func setSectionLineConstraints() {
        
        sectionLine.translatesAutoresizingMaskIntoConstraints = false
        sectionLine.centerYAnchor.constraint(equalTo: sectionName.centerYAnchor, constant: 5).isActive = true
        //sectionLine.bottomAnchor.constraint(equalTo: sectionTitle.bottomAnchor).isActive = true
        sectionLine.leadingAnchor.constraint(equalTo: sectionName.trailingAnchor, constant: 5).isActive = true
        sectionLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        sectionLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func configureBackground() {
        background.backgroundColor = UIColor(displayP3Red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        addSubview(background)
        setBackgroundConstraints()
    }
    
    func setBackgroundConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: sectionName.bottomAnchor, constant: 8).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.heightAnchor.constraint(equalToConstant: 221).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    func configureTextPlaceHolder() {
        textPlaceHolder.backgroundColor = UIColor(displayP3Red: 95/255, green: 47/255, blue: 56/255, alpha: 1)
        addSubview(textPlaceHolder)
        setTextPlaceHolderConstraints()
    }
    
    func setTextPlaceHolderConstraints() {
        textPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        textPlaceHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        textPlaceHolder.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        textPlaceHolder.heightAnchor.constraint(equalToConstant: 191).isActive = true
        textPlaceHolder.widthAnchor.constraint(equalToConstant: 159).isActive = true
    }
    
    func configureObjectTitle() {
        objectTitle.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        objectTitle.numberOfLines = 0
        objectTitle.adjustsFontSizeToFitWidth = true
        objectTitle.textColor = .white
        objectTitle.text = "The Death of Socrates"
        
        addSubview(objectTitle)
        setObjectTitleConstraints()
    }
    
    func setObjectTitleConstraints() {
        objectTitle.translatesAutoresizingMaskIntoConstraints = false
        objectTitle.topAnchor.constraint(equalTo: textPlaceHolder.topAnchor, constant: 12).isActive = true
        objectTitle.leadingAnchor.constraint(equalTo: textPlaceHolder.leadingAnchor, constant: 13).isActive = true
        objectTitle.trailingAnchor.constraint(equalTo: textPlaceHolder.trailingAnchor, constant: 27).isActive = true
    }
    
    func configureObjectYear() {
        objectYear.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        objectYear.textColor = .white
        objectYear.text = "1787"
        
        addSubview(objectYear)
        setObjectYearConstraints()
    }
    
    func setObjectYearConstraints() {
        objectYear.translatesAutoresizingMaskIntoConstraints = false
        objectYear.topAnchor.constraint(equalTo: objectTitle.bottomAnchor, constant: 16).isActive = true
        objectYear.leadingAnchor.constraint(equalTo: textPlaceHolder.leadingAnchor, constant: 16).isActive = true
        
    }
    
    func configureArtistName() {
        artistName.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        artistName.numberOfLines = 0
        artistName.adjustsFontSizeToFitWidth = true
        artistName.textColor = .white
        artistName.text = "Jacques Louis David French"
        addSubview(artistName)
        setArtistNameConstraints()
    }
    
    func setArtistNameConstraints() {
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.topAnchor.constraint(equalTo: objectYear.bottomAnchor, constant: 1).isActive = true
        artistName.leadingAnchor.constraint(equalTo: textPlaceHolder.leadingAnchor, constant: 16).isActive = true
        artistName.trailingAnchor.constraint(equalTo: textPlaceHolder.trailingAnchor, constant: -13).isActive = true
        
    }
    
    func configureObjectImage() {
        objectImage.image = UIImage(named: "deathSocrates")
        addSubview(objectImage)
        setObjectImageConstraint()
    }
    
    func setObjectImageConstraint() {
        objectImage.translatesAutoresizingMaskIntoConstraints = false
        objectImage.leadingAnchor.constraint(equalTo: textPlaceHolder.trailingAnchor, constant: 3).isActive = true
        objectImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        objectImage.centerYAnchor.constraint(equalTo: textPlaceHolder.centerYAnchor).isActive = true
        objectImage.heightAnchor.constraint(equalToConstant: 147).isActive = true
        
    }

}
