//
//  File 2.swift
//  
//
//  Created by Lujain Yhia on 08/08/1445 AH.
//

import Fluent

struct CreateAppointment: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Appointment")
            .id()
           // .field("title", .string )
            .field("Date", .string )
            .field("Time", .string )
            .field("AppointmentStatus", .string)
            .field("PropertiesId", .uuid , .references("Properties", "id"))
            .field("CustomerId", .uuid , .references("Customer", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Appointment").delete()
    }
}
