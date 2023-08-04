//
//  TripsController.swift
//
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Fluent
import Vapor

struct TripsController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let tripsRoute = routes.grouped("api", "trips")
        tripsRoute.get(use: getAll)
        tripsRoute.post(use: create)
        tripsRoute.delete(":tripId", use: delete)
    }

    func getAll(req: Request) async throws -> [Trip] {
        try await Trip.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Trip {
        let trips = try req.content.decode(Trip.self)
        try await trips.save(on: req.db)
        return trips
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let trip = try await Trip.find(req.parameters.get("tripId"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await trip.delete(on: req.db)
        return .noContent
    }
}
