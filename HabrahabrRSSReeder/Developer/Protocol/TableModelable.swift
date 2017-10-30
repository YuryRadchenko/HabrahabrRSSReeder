//
//  TableModelable.swift
//  beerga
//
//  Created Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//
//

/*
 Протокол для обозначения интерфейса модели таблицы,
 в которой будет функция регистрации ячеек (сделанных через xib)
 и переменная размера ячейки
 */

import UIKit

protocol TableModelable {
    func registerCell(in tableView: UITableView)
    var cellHeight: CGFloat {get}
}

extension TableModelable {
    
    static func register(models: Array<Self>, tableView: UITableView) {
        for item in models {
            item.registerCell(in: tableView)
        }
    }

    static func cellHeight(models: Array<Self>, indexPath: IndexPath) -> CGFloat {
        let item = models[indexPath.row]
        return item.cellHeight
    }
}
