//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Combine

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entity: Response) -> AnyPublisher<Bool, Error>
    func get(id: String) -> AnyPublisher<Bool, Error>
    func delete(id: String) -> AnyPublisher<Bool, Error>
}
