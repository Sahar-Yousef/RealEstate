//
//  File.swift
//  
//
//  Created by Sahora on 18/02/2024.
//


import Fluent
import Vapor
import FluentPostgresDriver


final class Customer: Model, Content {
    // Name of the table or collection.
    static let schema = "Customer"
    
    // Unique identifier for this Property.
    @ID(key: .id)
    var id: UUID?
    
    
    @Field(key: "Name")
    var Name: String
    
    @Field(key: "Contact")
    var Contact: Int
    
    //Raltionship with Appointment table
    @Children (for: \.$customer )
    var appointment: [Appointment]
    
    init() { }
    
    init(id: UUID? = nil, Name: String, Contact: Int) {
        self.id = id
        self.Name = Name
        self.Contact = Contact
        
    }
}
