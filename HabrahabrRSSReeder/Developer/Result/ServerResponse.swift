//
//  ServerResponse.swift
//  beerga
//
//  Created by Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//

import Foundation

typealias ServerResponse = (_ result: ServerResponseResult<Data>) -> Void

enum ServerResponseResult <T> {
    case success(T)
    case failure(PError)
}
