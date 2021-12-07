//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Combine

public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
