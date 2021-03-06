//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import SwiftUI
import Combine

public class GetPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    private var cancellables: Set<AnyCancellable> = []
    private let _useCase: Interactor
    @Published public var result: Response?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    public func get(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case.finished:
                    self.isLoading = false
                }
            }, receiveValue: { result in
                self.result = result
            })
            .store(in: &cancellables)
    }
}
