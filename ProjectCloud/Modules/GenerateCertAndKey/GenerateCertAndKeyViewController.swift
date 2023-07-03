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
            VStack(alignment: .leading) {
                
                if isCertGenerated {
                    CertAndKeyView(presenter: presenter)
                }
                
                Spacer()
                
                GenerateCertAndKeyView(
                    isCertGenerated: $isCertGenerated,
                    presenter: presenter
                )
                
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
