//
//  HomePresenter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Combine
import Foundation
import SwiftUI

final class HomePresenter: ObservableObject {
    
    // MARK: - Private properties -
    
    private let coordinator: Coordinator<HomeRouter>
    
    private let interactor: HomeInteractor
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle -
    
    init(
        interactor: HomeInteractor,
        coordinator: Coordinator<HomeRouter>
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    // MARK: - Public methods -
    
    func showHelloMessage() {
        coordinator.show(.hello)
    }
    
    func showCertGenerator() {
        coordinator.show(.cert)
    }
}
