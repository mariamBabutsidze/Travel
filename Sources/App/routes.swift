import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.post("api", "trip") { req -> EventLoopFuture<Trip> in
        print("req", req)
        let trip = try req.content.decode(Trip.self)
        return trip.save(on: req.db).map {
            trip
        }
    }
    
    try app.register(collection: TripsController())
}
