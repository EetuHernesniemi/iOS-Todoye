//
//  Item.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 31.3.2022.
//

import Foundation

class Item: Encodable, Decodable {
    var title : String = ""
    var done : Bool = false
}
