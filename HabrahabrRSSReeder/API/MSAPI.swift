//
//  MSAPI.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

enum MSAPI {
    static let baseHost = "https://habrahabr.ru/"
    static let rss2json = "https://api.rss2json.com/v1/api.json?rss_url="
    
    static func fullPath(url: String) -> String {
        return MSAPI.baseHost + url
    }
}
