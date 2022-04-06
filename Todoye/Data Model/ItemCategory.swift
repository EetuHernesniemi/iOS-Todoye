//
//  ItemCategory.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 5.4.2022.
//

import Foundation
import RealmSwift

class ItemCategory : Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

