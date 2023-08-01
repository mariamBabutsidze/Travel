//
//  CreateTrip.swift
//
//
//  Created by Mariam Babutsidze on 01.08.23.
//

import Fluent

struct CreateTrip: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("trips")
            .id()
            .field("title", .string, .required)
            .field("rating", .double, .required)
            .field("icon", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("trips").delete()
    }
}
