//
//  CreateCategory.swift
//  
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Fluent

struct CreateCategory: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("categories")
            .id()
            .field("title", .string, .required)
            .field("icon", .string, .required)
            .field("imageUrl", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("categories").delete()
    }
}
