//
//  RssService.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


typealias AlbumHandler = ([Album]) -> Void
final class RssService {
    
    static let shared = RssService()
    private init() {}
    
    var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        return URLSession(configuration: config)
    }()
    
    func getTopAlbums(_ completion: @escaping AlbumHandler) {
        
        guard let url = URL(string: RssApi().endpoint) else {
            return
        }
        
        session.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                completion([])
                print("Bad Data Task: \(error.localizedDescription)")
                return
            }
            
            if let data = dat {
                
                do {
                    
                    let albumResponse = try JSONDecoder().decode(AlbumFeed.self, from: data)
                    let albums = albumResponse.feed.results
                    completion(albums)
                    
                } catch {
                    print("Couldn't Decode Object: \(error.localizedDescription)")
                }
            }
            }.resume()
    }
    
    
    
    
    
    
}
