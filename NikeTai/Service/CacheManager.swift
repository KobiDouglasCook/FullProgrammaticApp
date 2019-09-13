//
//  CacheManager.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

let cacheManager = CacheManager.shared
typealias DataHandler = (Data?) -> Void

final class CacheManager {
    
    static let shared = CacheManager()
    private init() {}
    
    let cache = NSCache<NSString, NSData>()
    
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        return URLSession(configuration: config)
    }()
    
    
    func downloadImage(from urlString: String, completion: @escaping DataHandler) {
        
        
        if let dataObject = cache.object(forKey: urlString as NSString) {
            completion(dataObject as Data)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        
        session.dataTask(with: url) { [unowned self] (dat, _, err) in
            
            if let error = err {
                completion(nil)
                print("Cache - Data Task Error: \(error.localizedDescription)")
                return
            }
            
            if let data = dat {
                
                self.cache.setObject(data as NSData, forKey: urlString as NSString)
                
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            
            }.resume()
        
    }
    
    
    
}
