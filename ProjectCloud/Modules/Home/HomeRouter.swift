//
//  HomeRouter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Foundation
import UIKit
import SwiftUI

public enum HomeRouter: NavigationRouter {
    
    // MARK: - Common case -
    
    case hello
    case cert
    case home
    
    public typealias V = AnyView
    
    // MARK: - Public properties -
    
    public var transition: NavigationTranisitionStyle {
        switch self {
        case .hello:
            return .push
        case .home:
            return .push
        case .cert:
            return .push
        }
    }
    
    // MARK: - View Content -
    
    public func view(coordinator: Coordinator<HomeRouter>) -> AnyView {
        switch self {
        case .hello:
            let interactor = HelloMessageInteractor()
            let coordinatorMessage = Coordinator<HelloMessageRouter>()
            let presenter = HelloMessagePresenter(
                interactor: interactor,
                coordinator: coordinatorMessage
            )
            let view = HelloMessageViewController(presenter: presenter)
            return AnyView(view)
        case .home:
            let interactor = HomeInteractor()
            let presenter = HomePresenter(interactor: interactor, coordinator: coordinator)
            let view = HomeViewController(presenter: presenter)
            return AnyView(view)
        case .cert:
            let interactor = GenerateCertAndKeyInteractor()
            let coordinatorMessage = Coordinator<GenerateCertAndKeyRouter>()
            let presenter = GenerateCertAndKeyPresenter(
                interactor: interactor,
                coordinator: coordinatorMessage
            )
            let view = GenerateCertAndKeyViewController(presenter: presenter)
            return AnyView(view)
        }
    }
    
}

