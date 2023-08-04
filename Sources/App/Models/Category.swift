//
//  Category.swift
//  
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Fluent
import Vapor

final class Category: Model {
    static let schema = "categories"
    
    @ID
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "icon")
    var icon: String
    
    @Field(key: "imageUrl")
    var imageUrl: String
    
    init() {
        
    }
    
    init(id: UUID? = nil, title: String, icon: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.icon = icon
        self.imageUrl = imageUrl
    }
}

extension Category: Content {}

