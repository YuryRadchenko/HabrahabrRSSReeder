//
//  MSModelManager.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

typealias NewsResponse = (_ result: ServerResponseResult<[MSNews]>) -> Void

final class MSModelManager {
    
    static let shared = MSModelManager()
    
    func getFeed(completion:@escaping NewsResponse ) {
        
        APIManager.shared.getRSSFeed { (result) in
            switch result {
            case .success(let dataOk):
                
                let decoder = MSNews.jsonDecoder
                do {
                    let news = try decoder.decode(MSNewsArray.self, from: dataOk)
                    DispatchQueue.main.async(){
                        completion(.success(news.items))
                    }
                    
                } catch let err {
                    print("Parsing error: \(err.localizedDescription)")
                    let error = PError(from: err)
                    DispatchQueue.main.async(){
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                DispatchQueue.main.async(){
                    completion(.failure(error))
                }
            }
        }
    }
}
