//
//  TableCollectionViewCell.swift
//  DMET
//
//  Created by Felipe Santana on 20/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"
    
    private let myImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    public func configure(image: UIImage) {
        
        myImageView.image = image
        
    }
    
//    public func configure(with model: ArtObject) {
//
//        //fazer aqui função para pegar imagem
//        let image = UIImage()
//        myImageView.image = image
//
//    }
    
}
