//
//  File.swift
//  
//
//  Created by Lujain Yhia on 08/08/1445 AH.
//

import Fluent
import Vapor
import FluentPostgresDriver

struct CreateProperties: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Properties")
            .id()
            .field("Type", .string )
            .field("Size", .int )
            .field("City", .string )
            .field("Address", .string )
            .field("Owner", .string )
            .field("Price", .int )
            .field("Desc", .string )
            .field("Image", .string )
            .field("PropertyStatus", .string )
            .field("AgentId", .uuid , .references("Agent", "id"))
            .create()
        
          //  .field("Type", .string )
         //  .field("Size", .int )
          //  .field("City", .string )
         //   .field("Address", .string )
         //   .field("Owner", .string )
         //   .field("Price", .int )
         //   .field("Desc", .string )
         //   .field("Image", .string )
          //  .field("PropertyStatus", .string )
           // .field("Agent_Id", .uuid , .references("agent", "id"))
         //   .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Properties").delete()
    }
}

