//
//  CertInfoViewModifier.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 03.07.2023..
//

import Foundation
import SwiftUI

struct CertInfoViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .padding(10)
            .background(Color.blue.opacity(0.1))
            .border(Color.blue, width: 1)
            .cornerRadius(5)
    }
}

