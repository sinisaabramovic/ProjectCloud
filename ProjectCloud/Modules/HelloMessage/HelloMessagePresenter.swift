//
//  HelloMessagePresenter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Combine
import Foundation
import SwiftUI

final class HelloMessagePresenter: ObservableObject {
    
    // MARK: - Private properties -
    
    private let coordinator: Coordinator<HelloMessageRouter>
    
    private let interactor: HelloMessageInteractor
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Public properties -
    
    @Published var message: String = ""
    
    // MARK: - Lifecycle -
    
    init(
        interactor: HelloMessageInteractor,
        coordinator: Coordinator<HelloMessageRouter>
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        
        interactor.$helloMessage
            .map { $0.text }
            .assign(to: \.message, on: self)
            .store(in: &cancellables)
    }
}

// MARK: - Extensions -

extension HelloMessagePresenter {
    
    func handleShowHelloMessageButtonPressed() {
        interactor.getHelloMessage()
    }
    
}
