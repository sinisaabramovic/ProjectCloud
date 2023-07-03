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
    
    // MARK: - Content -
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
                if isCertGenerated {
                    CertAndKeyView(presenter: presenter)
                }
                
                Spacer()
                
                Section {
                    HStack {
                        Spacer()
                        ActionViewButton(
                            title: "Generate Cert & Key",
                            action: {
                                presenter.generateBaseCert()
                                isCertGenerated = true
                            }
                        )
                        .buttonStyle(AlertButtonStyle())
                        Spacer()
                    }
                }.padding(.horizontal, 34)
                
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
