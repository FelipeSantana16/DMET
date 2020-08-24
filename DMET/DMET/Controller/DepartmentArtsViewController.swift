//
//  DepartmentArtsViewController.swift
//  DMET
//
//  Created by Felipe Santana on 23/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class DepartmentArtsViewController: UIViewController {
    
    var objets = [ArtObject]()
    var images = [UIImage]()
    
    let collection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 194, height: 405)
        layout.minimumLineSpacing = 24
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
        collection.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
        setCollectionViewConstraints()
        collection.delegate = self
        collection.dataSource = self
        collection.register(DepartmentsArtCollectionViewCell.self, forCellWithReuseIdentifier: DepartmentsArtCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }
    
    func setCollectionViewConstraints() {
        
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}

extension DepartmentArtsViewController: UICollectionViewDelegate, UICollectionViewDataSource /*,UICollectionViewFlowLayout*/ {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: DepartmentsArtCollectionViewCell.identifier, for: indexPath) as! DepartmentsArtCollectionViewCell
        let name = objets[indexPath.row].title
        let year = objets[indexPath.row].date
        let image = images[indexPath.row]
        
        cell.configure(name: name, year: String(year), image: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.configure(image: images[indexPath.row], title: objets[indexPath.row].title, year: String(objets[indexPath.row].date), artist: objets[indexPath.row].artistName)
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
