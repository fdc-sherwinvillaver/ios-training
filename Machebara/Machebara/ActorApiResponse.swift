//
//  ActorApiResponse.swift
//  Machebara
//
//  Created by Lester  Padul on 13/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import Foundation
import ObjectMapper

class ActorApiResponse:Mappable {
    var actors : [Actor]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        actors <- map["actors"]
    }
}

class Actor:Mappable {
    var name : String?
    var description : String?
    var dob : String?
    var country : String?
    var height : String?
    var children : String?
    var imageUrl : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        dob <- map["dob"]
        country <- map["country"]
        height <- map["height"]
        children <- map["children"]
        imageUrl <- map["image"]
    }
}
