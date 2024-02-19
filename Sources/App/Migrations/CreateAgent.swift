//
//  File.swift
//  
//
//  Created by Lujain Yhia on 09/08/1445 AH.
//

import Fluent

struct CreateAgent: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Agent")
            .id()
            .field("Nme", .string, .required)
            .field("Contact", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Agent").delete()
    }
}
