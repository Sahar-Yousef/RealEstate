//
//  File.swift
//  
//
//  Created by Sahora on 18/02/2024.
//

import Fluent
import Vapor
import FluentPostgresDriver



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
    
    // Foreign Key to an Agent model.
    @Parent(key: "PropertiesId") //FK
    var properties: Properties
    
    // Foreign Key to an Customer model.
    @Parent(key: "CustomerId") //FK
    var customer: Customer
    


    init() { }

    init(id: UUID? = nil, Date: String, Time: String, AppointmentStatus: String,  PropertiesId: UUID, CustomerID: UUID ) {
        self.id = id
        self.Date = Date
        self.Time = Time
        self.AppointmentStatus = AppointmentStatus
        self.$properties.id = PropertiesId
        self.$customer.id = CustomerID

        
    }
}







