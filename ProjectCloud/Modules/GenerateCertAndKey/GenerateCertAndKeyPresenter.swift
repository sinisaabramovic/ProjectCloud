//
//  GenerateCertAndKeyPresenter.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Foundation
import SwiftUI
import Combine

final class GenerateCertAndKeyPresenter: ObservableObject {
    
    // MARK: - Public properties -
    
    @Published var certificate: String = ""
    @Published var privateKey: String = ""
    
    // MARK: - Private properties -
    
    private let coordinator: Coordinator<GenerateCertAndKeyRouter>
    
    private let interactor: GenerateCertAndKeyInteractor
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle -
    
    init(
        interactor: GenerateCertAndKeyInteractor,
        coordinator: Coordinator<GenerateCertAndKeyRouter>
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - Extensions -

extension GenerateCertAndKeyPresenter {
    
    func generateBaseCert() {
        guard
            let certData = try? CertGeneratorUtils.generateCertificateAndKey()
        else {
            print("NOT OK!")
            return
        }
        
        let base64Strings = CertGeneratorUtils.certAndKeyInBase64EncodedStrings(from: certData)
        
        certificate = base64Strings.certificate
        privateKey = base64Strings.privateKey
    }
    
}
