//
//  ViewModel.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}

class ViewModel {
    
    
    var albums = [Album]() {
        didSet {
            delegate?.updateView()
        }
    }
    
    var currentAlbum: Album!
    
    weak var delegate: ViewModelDelegate?
    
    
    func get() {
        RssService.shared.getTopAlbums { [unowned self] albms in
            self.albums = albms
        }
    }
    
    
    
}
