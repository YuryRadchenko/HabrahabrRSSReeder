//
//  MSNews.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation

final class MSNews: Codable {
    var title = ""
    var pubDate: Date?
    var pudDateFormatted: String {
        if let date = self.pubDate {
            return Formatter.shortDate.string(from: date)
        }
        return ""
    }
    var link: String?
    var guid: String?
    var author: String?
    var definition: String?
    var contentHtml: String?
    var contentString: String {
        return self.contentHtml?.html2String ?? ""
    }
    var categories: [String] = []
    
    var categoriesDescription: String {
        var returnValue = ""
        for category in self.categories {
            returnValue += category
            if category != self.categories.last {
                returnValue += ", "
            }
        }
        return returnValue
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case pubDate
        case link
        case guid
        case author
        case definition = "description"
        case contentHtml = "content"
        case categories
    }
    
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            let date = Formatter.ddMMyyyyHHmmss.date(from: dateStr)
            guard let _date = date else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
            }
            //print("DATE DECODER \(dateStr) to \(date_)")
            return _date
        })
        return decoder
    }
}

