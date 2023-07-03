//
//  HelloMessageViewController.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 01.07.2023..
//

import Combine
import Foundation
import SwiftUI

struct HelloMessageViewController: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: HelloMessagePresenter
    
    // MARK: - View Content -
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text(presenter.message)
                    .padding(.bottom, 20)
                Spacer()
                ActionViewButton(
                    title: "Hello",
                    action: presenter.handleShowHelloMessageButtonPressed
                )
                .buttonStyle(BaseConfirmButtonStyle())
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

