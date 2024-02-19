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
            .field("title", .string, .required)
            .field("Date", .string, .required)
            .field("Time", .string, .required)
            .field("AppointmentStatus", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Appointment").delete()
    }
}
