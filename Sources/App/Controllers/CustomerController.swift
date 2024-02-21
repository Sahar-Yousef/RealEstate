//
//  File 3.swift
//  
//
//  Created by Haneen Rida Shagroon on 11/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
//customer has POST & GET
struct CustomerController: RouteCollection {
  
  func boot(routes: RoutesBuilder) throws {
    let customersRoute = routes.grouped("customers")
      
    customersRoute.get(use: index)
      customersRoute.post(use: create)
  }

    
    func index(req: Request) async throws -> [Customer] {
           try await Customer.query(on: req.db).all()
        }
    
    func create(req: Request) async throws -> Customer {
          let customer = try req.content.decode(Customer.self)
           try await customer.save(on: req.db)
           return customer
      }
    
    
//  func createHandler(_ req: Request)throws -> EventLoopFuture<Customer> {
//    // 6
//    let customer = try req.content.decode(Customer.self)
//    // 7
//    return customer.save(on: req.db).map { customer }
//  }
}
