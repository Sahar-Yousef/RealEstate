import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    
//    app.post("agents") { req -> EventLoopFuture<Agent> in
//        let agent = try req.content.decode(Agent.self) // content = body of request
//        return agent.create(on: req.db).map { agent }
//    }
//    
//    app.get ("agents") { req -> EventLoopFuture<Agent> in
//        let agent = try req.content.decode(Agent.self) // content = body of request
//        return agent.create(on: req.db).map { agent }
//    }
    
    try app.register(collection: AgentController())
    try app.register(collection: AppointmentController())
    try app.register(collection: CustomerController())
    try app.register(collection: PropertiesController())
    try app.register(collection: TodoController())
}
