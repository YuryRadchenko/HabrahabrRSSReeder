//
//  MSNewsArray.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

final class MSNewsArray: Codable {
    var items: [MSNews] = []
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
