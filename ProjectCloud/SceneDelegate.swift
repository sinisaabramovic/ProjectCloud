//
//  SceneDelegate.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

// Source: https://gist.githubusercontent.com/mohamadrezakoohkan/6c25e7536bbbfed2cdee89bed5ceaecf/raw/be311a1b92bb366eac9afbebee169f1194a37dad/coordinator-intro-scenedelegate.swift

import Foundation
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    // MARK: - Private properties -
    
    private let coordinator: Coordinator<HomeRouter> = .init(startingRoute: .home)
    
    // MARK: - Public properties -
    
    var window: UIWindow?
    
    // MARK: - Lifecycle -
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}
