//
//  GenerateCertAndKeyView.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 03.07.2023..
//

import Combine
import Foundation
import SwiftUI

struct GenerateCertAndKeyView: View {
    
    // MARK: - Private properties -
    
    @Binding var isCertGenerated: Bool
    let presenter: GenerateCertAndKeyPresenter
    
    // MARK: - Content -

    var body: some View {
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
    }
}

