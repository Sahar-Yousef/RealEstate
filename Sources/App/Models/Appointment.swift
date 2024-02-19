//
//  File.swift
//  
//
//  Created by Sahora on 18/02/2024.
//

import Fluent
import Vapor


final class Appointment: Model {
    // Name of the table or collection.
    static let schema = "Appointment"

    // Unique identifier for this Property.
    @ID(key: .id)
    var id: UUID?

    
    @Field(key: "Date")
    var Date: String

    @Field(key: "Time")
    var Time: String

    @Field(key: "AppointmentStatus")
    var AppointmentStatus: String

////     Foreign Key to an Agent model.
//    @Parent(key: "AgentID")
//var agentID: UUID
//    // Foreign Key to an Customer model.
//    @Parent(key: "CustomerID")
//    var CustomerID: UUID

    init() { }

    init(id: UUID? = nil, Date: String, Time: String, AppointmentStatus: String,  agentID: UUID, CustomerID: UUID ) {
        self.id = id
        self.Date = Date
        self.Time = Time
        self.AppointmentStatus = AppointmentStatus
        //self.$agentID.id = agentID
       // self.$CustomerID.id = CustomerID

        
    }
}







