//
//  Poke.swift
//  DemoRequestApi
//
//  Created by Bui Van Tuan on 7/1/19.
//  Copyright © 2019 Bui Van Tuan. All rights reserved.
//

import Foundation
import UIKit

struct Poke: Codable {
    var abilities: [DataAbilities]?
    var helditems: [Helditems]?
    private enum CodingKeys: String, CodingKey {
        case abilities
        case helditems = "held_items"
    }
}
struct DataAbilities: Codable {
    var ability: Ability
}
struct Ability: Codable {
    var name: String?
    var url: String?
}

struct Helditems: Codable {
    var item: Item
    var versiondetails: [Versiondetails]
      private enum CodingKeys: String, CodingKey {
        case item
        case versiondetails = "version_details"
    }
}
struct Item: Codable {
    var name: String?
    var url: String?
}
struct Versiondetails: Codable {
    var version: Vesion
}

struct Vesion: Codable {
    var name:String?
    var url:String?
}
