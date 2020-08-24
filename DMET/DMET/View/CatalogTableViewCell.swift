//
//  CatalogTableViewCell.swift
//  DMET
//
//  Created by Felipe Santana on 19/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    static let identifier = "CatalogTableViewCell"
    
    var sectionNumber = UILabel()
    var sectionPoint = UIView()
    var sectionTitle = UILabel()
    let sectionLine = UIView()
    let seeAll = UIButton()
    var sectionNum = Int()
    
//    var artObjects = [ArtObject]()
    
    var images = [UIImage]() {
        
        didSet {
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
                
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 104, height: 144)
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(images: [UIImage], sectionTitle: String, sectionNumber: Int) {
        
        
        self.images = images
        //self.artObjects = artobjects
        var num = String()
        if sectionNumber < 10 {
            
            num = "0" + String(sectionNumber)
            
        } else {
            
            num = String(sectionNumber)
            
        }
        
        setupSectionNumber(number: num)
        setupTitle(title: sectionTitle)
        setupPoint()
        setupSeeAll()
        setupSectionLine()
        setupCollectionView()
        
        collectionView.reloadData()
        
    }
    
    
    func setupSectionNumber(number: String) {

        sectionNumber.font = UIFont(name: "Baskerville", size: 40)
        sectionNumber.textColor = .white
        sectionNumber.text = number
        
        addSubview(sectionNumber)
        
        setNumberConstraints()
        
    }
    
    func setupPoint() {
        addSubview(sectionPoint)
        sectionPoint.backgroundColor = UIColor(displayP3Red: 95/255, green: 47/255, blue: 56/255, alpha: 1)
        setPointConstraints()
    }
    
    func setupTitle(title: String) {
        addSubview(sectionTitle)
        sectionTitle.numberOfLines = 0
        sectionTitle.adjustsFontSizeToFitWidth = true
        sectionTitle.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        sectionTitle.text = title
        sectionTitle.textColor = .white
        setTitleConstraints()
        
    }
    
    func setupSectionLine() {
        addSubview(sectionLine)
        sectionLine.backgroundColor = UIColor(displayP3Red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        setLineConstraint()
        
    }
    
    func setupSeeAll() {
        addSubview(seeAll)
        seeAll.setTitle("See All", for: .normal)
        seeAll.setTitleColor(.white, for: .normal)
        seeAll.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        //seeAll.addTarget(self, action: #selector(seeAllArt), for: .touchUpInside)
        setSeeAllContraint()
        
    }
    
//    @objc func seeAllArt(sender: UIButton!) {
//        let departmentArtsVC = DepartmentArtsViewController()
//        departmentArtsVC.objets = self.artObjects
//        departmentArtsVC.images = images
//        navigationController?.pushViewController(departmentArtsVC, animated: true)
//
//    }
    
    func setupCollectionView() {
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        addSubview(collectionView)
        setCollectionViewConstraints()
        
    }
    
    func setNumberConstraints() {
        
        sectionNumber.translatesAutoresizingMaskIntoConstraints = false
        sectionNumber.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        sectionNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
    }
    
    func setPointConstraints() {
        
        sectionPoint.translatesAutoresizingMaskIntoConstraints = false
        sectionPoint.centerYAnchor.constraint(equalTo: sectionNumber.centerYAnchor, constant: 10).isActive = true
        //sectionPoint.bottomAnchor.constraint(equalTo: sectionNumber.bottomAnchor).isActive = true
        sectionPoint.leadingAnchor.constraint(equalTo: sectionNumber.trailingAnchor, constant: 1).isActive = true
        sectionPoint.heightAnchor.constraint(equalToConstant: 8).isActive = true
        sectionPoint.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
    }
    
    func setTitleConstraints() {
        
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.topAnchor.constraint(equalTo: sectionNumber.bottomAnchor, constant: 1).isActive = true
        sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        //sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
    }
    
    func setSeeAllContraint() {
        
        seeAll.translatesAutoresizingMaskIntoConstraints = false
        seeAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        seeAll.heightAnchor.constraint(equalToConstant: 4).isActive = true
        seeAll.centerYAnchor.constraint(equalTo: sectionTitle.centerYAnchor).isActive = true
        
    }
    
    func setLineConstraint() {
        
        sectionLine.translatesAutoresizingMaskIntoConstraints = false
        sectionLine.centerYAnchor.constraint(equalTo: sectionTitle.centerYAnchor, constant: 5).isActive = true
//        sectionLine.bottomAnchor.constraint(equalTo: sectionTitle.bottomAnchor).isActive = true
        sectionLine.leadingAnchor.constraint(equalTo: sectionTitle.trailingAnchor, constant: 5).isActive = true
        sectionLine.trailingAnchor.constraint(equalTo: seeAll.leadingAnchor, constant: -5).isActive = true
        sectionLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setCollectionViewConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 4).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 144).isActive = true
    }
    
}

extension CatalogTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell
        
        cell.configure(image: images[indexPath.row])
        
        return cell
    }
    
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
}
