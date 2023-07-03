//
//  GenerateCertAndKeyViewController.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Combine
import Foundation
import SwiftUI

struct GenerateCertAndKeyViewController: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: GenerateCertAndKeyPresenter
    
    // MARK: - Private properties -
    
    @State private var isCertGenerated = false
    
    // MARK: - View Content -
    
    var body: some View {
        GeometryReader { geometry in
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                
                if isCertGenerated {
                    CertAndKeyView(presenter: presenter)
                }
                
                Spacer(minLength: 0)
                
                GenerateCertAndKeyView(
                    isCertGenerated: $isCertGenerated,
                    presenter: presenter
                )
                .padding(.bottom, 54)
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}
