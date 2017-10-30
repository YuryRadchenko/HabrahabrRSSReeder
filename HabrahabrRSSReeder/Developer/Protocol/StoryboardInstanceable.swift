//
//  StoryboardInstanceable.swift
//  beerga
//
//  Created Yury Radchenko on 28.05.17.
//  Copyright © 2017 iPadchenko. All rights reserved.
//
//

/*
 //Пример использования
 
 //1. Storyboard Id конкретного ViewController'а должно быть такое же как имя класса.
 //2. Во ViewController'е необходимо указать имя Storyboard
 //Например:
 
 //MARK: - StoryboardInstanceable -
 extension HMB_Name_ViewController: StoryboardInstanceable {
    static var storyboardName: StoryboardName = .auth
 }
 
 //Тогда вызов контроллера можно делать так:
 
 if let nameVC = HMB_Name_ViewController.storyboardInstance {
    self.navigationController?.pushViewController(nameVC, animated: true)
 }
 */

import UIKit

protocol StoryboardInstanceable {
    static var storyboardName: StoryboardName {get set}
}

extension StoryboardInstanceable {
    static var storyboardInstance: Self? {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:String(describing: self)) as? Self
        return vc
    }
}


