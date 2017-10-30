//
//  CellDequeueReusable.swift
//  beerga
//
//  Created Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//
//

import UIKit

protocol CellDequeueReusable { }

extension CellDequeueReusable {
    static func cell(table: UITableView, indexPath: IndexPath) -> Self {
        let cell = table.dequeueReusableCell(withIdentifier: String(describing: self), for: indexPath) as! Self
        return cell
    }
}
