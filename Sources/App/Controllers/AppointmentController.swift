//
//  File 2.swift
//  
//
//  Created by Haneen Rida Shagroon on 11/08/1445 AH.
//


import Foundation
import Fluent
import Vapor


//appointment has POST , GET, PATCH & DELETE
struct AppointmentController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let appointmentsRoute = routes.grouped("appointments")
        appointmentsRoute.get(use: index)
        appointmentsRoute.post(use: create)
        appointmentsRoute.put(use: update)
//        appointmentsRoute.group(":appointmentID") { todo in
        appointmentsRoute.delete(use: delete)
//        }
    }
    

}

func index(req: Request) async throws -> [Appointment] {
    try await Appointment.query(on: req.db).all()
}

func create(req: Request) async throws -> Appointment {
    let appointment = try req.content.decode(Appointment.self)
    try await appointment.save(on: req.db)
    return appointment
}

func delete(req: Request) async throws -> HTTPStatus {
        guard let appointment = try await Appointment.find(req.parameters.get("appointmentID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await appointment.delete(on: req.db)
        return .noContent
    }
func update(req: Request) async throws -> Appointment {
       guard let appointment = try await Appointment.find(req.parameters.get("id"), on: req.db) else {
           throw Abort(.notFound)
       }
       let updatedAppointment = try req.content.decode(Appointment.self)
    appointment.AppointmentStatus = updatedAppointment.AppointmentStatus
       try await appointment.save(on: req.db)
       return appointment
   }
