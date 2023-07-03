//
//  CertAndKeyView.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 03.07.2023..
//

import Combine
import Foundation
import SwiftUI

struct CertAndKeyView: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: GenerateCertAndKeyPresenter
    
    // MARK: - Content -
    
    var body: some View {
        VStack(alignment: .leading) {
            Section {
                Text("Certificate:")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text(presenter.certificate)
                    .modifier(CertInfoViewModifier())
            }.padding(.horizontal, 34)
            
            Section {
                Text("Private Key:")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text(presenter.privateKey)
                    .modifier(CertInfoViewModifier())
            }.padding(.horizontal, 34)
        }
    }
}

