//
//  ButtonPressable.swift
//  pddUkraine
//
//  Created by Yury Radchenko on 11.10.2017.
//  Copyright © 2017 AS Center Promin. All rights reserved.
//

import UIKit

protocol ButtonPressab: class {
    func taped<T>(button: UIButton, data: T?)
}
