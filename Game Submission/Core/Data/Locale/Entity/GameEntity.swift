//
//  GameEntity.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var rating: Double = 0
    @objc dynamic var released: String = ""
    @objc dynamic var background_image: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
