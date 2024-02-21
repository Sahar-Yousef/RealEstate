//
//  File.swift
//  
//
//  Created by Haneen Rida Shagroon on 11/08/1445 AH.
//


import Foundation
import Fluent
import Vapor


//agent has POST & GET
struct AgentController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let agentsRoute = routes.grouped("agents")
        
        agentsRoute.get(use: index)
        agentsRoute.post(use: create)
    }
    
    
    func index(req: Request) async throws -> [Agent] {
        try await Agent.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Agent {
        let agent = try req.content.decode(Agent.self)
        try await agent.save(on: req.db)
        return agent
    }
}
