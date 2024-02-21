//
//  File.swift
//  
//
//  Created by Lujain Yhia on 09/08/1445 AH.
//

import Fluent

struct CreateCustomer: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Customer")
            .id()
            .field("Name", .string, .required)
            .field("Contact", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Customer").delete()
    }
}
