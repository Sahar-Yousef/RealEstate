import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    do{
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("localhost") ?? "localhost",
    //    port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("postgres") ?? "postgres",
        password: Environment.get("") ?? "",
        database: Environment.get("realestate") ?? "realestate",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

  //  app.migrations.add(CreateTodo())
   
   
   
    
    
    app.migrations.add(CreateAgent())
    app.migrations.add(CreateProperties())
    app.migrations.add(CreateCustomer())
    app.migrations.add(CreateAppointment())
    app.views.use(.leaf)

    

    // register routes
    try routes(app)
  
     } catch {
         // Handle configuration errors
         print("Failed to configure application: \(error)")
         throw error // Re-throw the error to propagate it further
     }
}

