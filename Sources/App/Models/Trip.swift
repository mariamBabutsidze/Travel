//
//  Trip.swift
//
//
//  Created by Mariam Babutsidze on 01.08.23.
//

import Fluent
import Vapor

final class Trip: Model {
    static let schema = "trips"
    
    @ID
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "rating")
    var rating: Double
    
    @Field(key: "icon")
    var icon: String
    
    init() {
        
    }
    
    init(id: UUID? = nil, title: String, rating: Double, icon: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.icon = icon
    }
}

extension Trip: Content {}
