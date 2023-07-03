//
//  NavigationRouter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

// Source: https://betterprogramming.pub/an-introduction-to-coordinator-pattern-in-swiftui-38e5b02f031f

import Foundation
import SwiftUI

public enum NavigationTranisitionStyle {
    case push
    case presentModally
    case presentFullscreen
}

public protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTranisitionStyle { get }
    
    /// Creates and returns a view of assosiated type
    ///
    @ViewBuilder
    func view(coordinator: Coordinator<Self>) -> V
}
