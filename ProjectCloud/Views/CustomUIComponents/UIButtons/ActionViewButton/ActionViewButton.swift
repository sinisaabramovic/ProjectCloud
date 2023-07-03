//
//  ActionViewButton.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Foundation
import SwiftUI

struct ActionViewButton: View {
    
    // MARK: - Public properties -
    
    private let title: String
    private let action: () -> Void
    
    // MARK: - Lifecycle -
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    // MARK: - View Content -
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .cornerRadius(10)
        }
        .padding(.horizontal, 34)
    }
}
