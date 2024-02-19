//
//  File.swift
//  
//
//  Created by Lujain Yhia on 08/08/1445 AH.
//

import Fluent

struct CreateProperties: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Properties")
            .id()
            .field("Type", .string, .required)
            .field("Size", .int, .required)
            .field("City", .string, .required)
            .field("Address", .string, .required)
            .field("Owner", .string, .required)
        
//            .id()
        
            .field("Price", .int, .required)
            .field("Desc", .string, .required)
            .field("Image", .string, .required)
            .field("PropertyStatus", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Properties").delete()
    }
}

