//
//  HelloMessageRouter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//


import SwiftUI

public enum HelloMessageRouter: NavigationRouter {
    
    // MARK: - Common case -
    
    case hello
    
    public typealias V = AnyView
    
    // MARK: - Public properties -
    
    public var transition: NavigationTranisitionStyle {
        switch self {
        case .hello:
            return .push
        }
    }
    
    // MARK: - View Content -
    
    public func view(coordinator: Coordinator<HelloMessageRouter>) -> AnyView {
        switch self {
        case .hello:
            let interactor = HelloMessageInteractor()
            let preseneter = HelloMessagePresenter(
                interactor: interactor,
                coordinator: coordinator
            )
            let view = HelloMessageViewController(presenter: preseneter)
            return AnyView(view)
        }
    }
}
