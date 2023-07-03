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
    
    // MARK: - Content -
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ActionViewButton(
                    title: "Generate Cert & Key",
                    action: presenter.generateBaseCert
                )
                .buttonStyle(AlertButtonStyle())
                .padding(.bottom, 10)
                
                Spacer()
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}
