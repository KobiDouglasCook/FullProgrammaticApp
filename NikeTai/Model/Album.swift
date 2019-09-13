//
//  Album.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct AlbumFeed: Decodable {
    let feed: AlbumResults
}

struct AlbumResults: Decodable {
    let results: [Album]
}

class Album: Decodable {
    
    let artworkUrl: String
    let artistUrl: String
    let copyright: String
    let release: String?
    let artist: String
    let genres: [Genre]
    let name: String
    let url: String
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case artworkUrl = "artworkUrl100"
        case artistUrl
        case copyright
        case release
        case artist = "artistName"
        case genres
        case name
        case url
        case id
    }
    
}


struct Genre: Decodable {
    let name: String
}
