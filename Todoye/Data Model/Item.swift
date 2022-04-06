//
//  Item.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 5.4.2022.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: ItemCategory.self, property: "items")
}
