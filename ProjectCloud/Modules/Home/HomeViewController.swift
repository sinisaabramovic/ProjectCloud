//
//  HomeViewController.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Combine
import Foundation
import SwiftUI

struct HomeViewController: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: HomePresenter
    
    // MARK: - View Content -
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ActionViewButton(
                    title: "Show Hello",
                    action: presenter.showHelloMessage
                )
                .buttonStyle(BaseConfirmButtonStyle())
                .padding(.bottom, 10)
                
                ActionViewButton(
                    title: "Cert",
                    action: presenter.showCertGenerator
                )
                .buttonStyle(BaseConfirmButtonStyle())
                .padding(.bottom, 54)
                
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
