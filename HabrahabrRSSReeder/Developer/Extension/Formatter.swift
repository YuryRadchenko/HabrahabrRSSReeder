//
//  Formatter.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

extension Formatter {
    static let ddMMyyyyHHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //"2017-10-30 07:34:53"
        return formatter
    }()
    
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
