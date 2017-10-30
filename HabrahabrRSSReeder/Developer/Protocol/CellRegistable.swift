//
//  CellRegistable.swift
//  beerga
//
//  Created Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//
//

/*
 1. Индетификатор ячейки должен быть такой же как имя класса ячейки.
 2. Подключить протокол к классу ячейки.
 3. Регистрация ячейки xib тогда:
 VSCallDetailTitleTableViewCell.register(table: tableView)
 */

import UIKit

protocol CellRegistable { }

extension CellRegistable {
    static func register(table: UITableView) {
        table.register(UINib.init(nibName: String(describing: self), bundle: nil), forCellReuseIdentifier: String(describing: self))
    }
}
