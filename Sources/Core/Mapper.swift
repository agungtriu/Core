//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Foundation
public protocol Mapper {
    associatedtype Responses
    associatedtype Entities
    associatedtype Domains
    associatedtype Entity
    associatedtype Domain
    
    func transformResponsesToDomains(responses: Responses) -> Domains
    func transformEntitiesToDomains(entities: Entities) -> Domains
    func trasformDomainToEntity(domain: Domain) -> Entity
}
