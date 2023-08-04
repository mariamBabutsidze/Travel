//
//  CategoriesController.swift
//  
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Fluent
import Vapor

struct CategoriesController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let categoriesRoute = routes.grouped("api", "categories")
        categoriesRoute.get(use: getAll)
        categoriesRoute.post(use: create)
        categoriesRoute.delete(":categoryId", use: delete)
    }

    func getAll(req: Request) async throws -> [Category] {
        try await Category.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Category {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return category
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let category = try await Category.find(req.parameters.get("categoryId"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await category.delete(on: req.db)
        return .noContent
    }
}

