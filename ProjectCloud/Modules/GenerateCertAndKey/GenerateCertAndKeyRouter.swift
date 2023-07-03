//
//  GenerateCertAndKeyRouter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Foundation
import Foundation
import UIKit
import SwiftUI

public enum GenerateCertAndKeyRouter: NavigationRouter {
    
    // MARK: - Common case -
    
    case cert
    
    public typealias V = AnyView
    
    // MARK: - Public properties -
    
    public var transition: NavigationTranisitionStyle {
        switch self {
        case .cert:
            return .push
        }
    }
    
    // MARK: - Content -
    
    public func view(coordinator: Coordinator<GenerateCertAndKeyRouter>) -> AnyView {
        switch self {
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
