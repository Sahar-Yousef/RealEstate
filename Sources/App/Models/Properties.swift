//
//  File.swift
//  
//
//  Created by Sahora on 18/02/2024.
//


import Fluent
import Vapor
import FluentPostgresDriver

final class Properties: Model , Content{
    // Name of the table or collection.
    static let schema = "Properties"

    // Unique identifier for this Property.
    @ID(key: .id)
    var id: UUID?

    
    @Field(key: "Type")
    var type: String

    @Field(key: "Size")
    var size: Int

    @Field(key: "City")
    var city: String

    @Field(key: "Address")
    var address: String

    @Field(key: "Owner")
    var owner: String

    // Foreign Key to an Agent model
    @Parent(key: "AgentId") //FK
    var agent: Agent

    @Field(key: "Price")
    var price: Int

    @Field(key: "Desc")
    var description: String
    
    @Field(key: "Image")
    var image: String

    @Field(key: "PropertyStatus")
    var propertyStatus: String
    
    //Raltionship with Appointment table
    @Children (for: \.$properties )
    var appointment: [Appointment]

    init() { }

    init(id: UUID? = nil, name: String, size: Int, city: String, address: String, owner: String, agentID: UUID, price: Int, description: String, image: String, propertyStatus: String, AgentId: UUID) {
        self.id = id
        self.type = type
        self.size = size
        self.city = city
        self.address = address
        self.owner = owner
        self.$agent.id = AgentId //FK
        self.price = price
        self.description = description
        self.image = image
        self.propertyStatus = propertyStatus
    }
    
}
