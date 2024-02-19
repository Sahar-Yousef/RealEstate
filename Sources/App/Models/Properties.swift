//
//  File.swift
//  
//
//  Created by Sahora on 18/02/2024.
//


import Fluent
import Vapor

final class Properties: Model {
    // Name of the table or collection.
    static let schema = "Properties"

    // Unique identifier for this Property.
    @ID(key: .id)
    var id: UUID?

    
    @Field(key: "Type")
    var name: String

    @Field(key: "Size")
    var size: Int

    @Field(key: "City")
    var city: String

    @Field(key: "Address")
    var address: String

    @Field(key: "Owner")
    var owner: String

    // Foreign Key to an Agent model.
  //  @Parent(key: "AgentID")
  //  var agentID: UUID

    @Field(key: "Price")
    var price: Int

    @Field(key: "Desc")
    var description: String
    
    @Field(key: "Image")
    var image: String

    @Field(key: "PropertyStatus")
    var propertyStatus: String

    init() { }

    init(id: UUID? = nil, name: String, size: Int, city: String, address: String, owner: String, agentID: UUID, price: Int, description: String, image: String, propertyStatus: String) {
        self.id = id
        self.name = name
        self.size = size
        self.city = city
        self.address = address
        self.owner = owner
     //   self.$agentID.id = agentID
        self.price = price
        self.description = description
        self.image = image
        self.propertyStatus = propertyStatus
    }
}
