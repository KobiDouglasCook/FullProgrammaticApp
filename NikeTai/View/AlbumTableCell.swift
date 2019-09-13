//
//  AlbumTableCell.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    
    var album: Album? {
        didSet {
            
            albumMainLabel.text = album?.name
            albumSubLabel.text = album?.artist
            
            cacheManager.downloadImage(from: album!.artworkUrl) { [weak self] dat in
                if let data = dat, let image = UIImage(data: data) {
                    self?.albumImage.image = image
                }
            }
            
        }
    }
    
    
    private let albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let albumMainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private let albumSubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    
    static let identifier = "AlbumTableCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labelStackView = UIStackView(arrangedSubviews: [albumMainLabel, albumSubLabel])
        labelStackView.distribution = .equalSpacing
        labelStackView.axis = .vertical
        labelStackView.spacing = 5
        
        addSubviews(albumImage, labelStackView)
        
        albumImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0), size: .init(width: 70, height: 0))
        

        
        labelStackView.anchor(top: topAnchor, leading: albumImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 0))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    

}
