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
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Properties").delete()
    }
}

