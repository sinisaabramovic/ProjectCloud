//
//  Coordinator.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

// Source: https://betterprogramming.pub/an-introduction-to-coordinator-pattern-in-swiftui-38e5b02f031f

import SwiftUI

open class Coordinator<Router: NavigationRouter>: ObservableObject {
    
    // MARK: - Public properties -
    
    public let navigationController: UINavigationController
    public let startingRoute: Router?
    
    // MARK: - Lifecycle -
    
    public init(
        navigationController: UINavigationController = .init(),
        startingRoute: Router? = nil
    ) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
    }
    
    public func start() {
        guard let route = startingRoute else { return }
        show(route)
    }
    
    public func show(
        _ route: Router,
        animated: Bool = true
    ) {
        let view = route.view(coordinator: self)
        let viewController = UIHostingController(rootView: view)
        switch route.transition {
        case .push:
            navigationController.pushViewController(
                viewController,
                animated: animated
            )
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(
                viewController,
                animated: animated
            )
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(
                viewController,
                animated: animated
            )
        }
    }
    
    public func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    open func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: true) { [weak self] in
            /// because there is a leak in UIHostingControllers that prevents from deallocation
            self?.navigationController.viewControllers = []
        }
    }
}
