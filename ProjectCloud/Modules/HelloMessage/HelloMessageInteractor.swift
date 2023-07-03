//
//  HelloMessageInteractor.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Combine
import Foundation
import SwiftUI

final class HelloMessageInteractor: ObservableObject {
    
    // MARK: - Public properties -
    
    @Published var helloMessage = HelloMessageModel(text: "")
    
    // MARK: - Public methods -
    
    func getHelloMessage() {
        self.helloMessage = HelloMessageModel(text: "Hello")
    }
}
