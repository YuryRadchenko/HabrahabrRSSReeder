//
//  ManagerResult.swift
//  beerga
//
//  Created by Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//

import Foundation

typealias VCManagerResult = (_ result: ManagerResult) -> Void

enum ManagerResult {
    case success
    case failure(PError)
}
