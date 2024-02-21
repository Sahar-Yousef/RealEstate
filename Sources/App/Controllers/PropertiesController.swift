//
//  File 4.swift
//  
//
//  Created by Haneen Rida Shagroon on 11/08/1445 AH.
//



import Foundation
import Fluent
import Vapor


//appointment has POST , GET, PATCH & DELETE
struct PropertiesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let propertiesRoute = routes.grouped("properties")
        propertiesRoute.get(use: index)
        propertiesRoute.post(use: create)
        propertiesRoute.put(use: update)
//        appointmentsRoute.group(":propertiesID") { properties in
        propertiesRoute.delete(use: delete)
//        }
    }
    
    func index(req: Request) async throws -> [Properties] {
        try await Properties.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Properties {
        let properties = try req.content.decode(Properties.self)
        try await properties.save(on: req.db)
        return properties
    }
}
func deleteProperty(req: Request) async throws -> HTTPStatus {
        guard let properties = try await Properties.find(req.parameters.get("propertiesID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await properties.delete(on: req.db)
        return .noContent
    }
func updateProperty(req: Request) async throws -> Properties {
       guard let properties = try await Properties.find(req.parameters.get("id"), on: req.db) else {
           throw Abort(.notFound)
       }
       let updatedProperties = try req.content.decode(Properties.self)
    properties.propertyStatus = updatedProperties.propertyStatus
       try await properties.save(on: req.db)
       return properties
   }

