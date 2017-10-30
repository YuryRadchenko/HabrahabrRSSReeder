//
//  APIManagerRSS.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

extension APIManager {
    
    func getRSSFeed(completion:@escaping ServerResponse) {
        let requestURL = MSAPI.fullPath(url: "rss/hubs")
        let jsonRequestURL = MSAPI.rss2json + requestURL
        
        self.request(jsonRequestURL, method: .get) { result in
            completion(result)
        }
    }
}
