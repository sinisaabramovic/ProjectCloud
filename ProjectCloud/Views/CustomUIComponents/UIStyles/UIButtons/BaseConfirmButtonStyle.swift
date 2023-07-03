//
//  BaseConfirmButtonStyle.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Foundation
import SwiftUI

struct BaseConfirmButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .semibold))
            .frame(height: 54)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}
