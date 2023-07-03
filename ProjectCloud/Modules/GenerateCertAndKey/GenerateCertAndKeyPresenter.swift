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
    
    // MARK: - Public methods -
    
    func generateBaseCert() {
        guard
            let certData = try? CertGeneratorUtils.generateCertificateAndKey()
        else {
            print("NOT OK!")
            return
        }
        
        let base64Strings = CertGeneratorUtils.certAndKeyInBase64EncodedStrings(from: certData)
        
        print(base64Strings.certificate)
        print("-----------------------------------------------------------------")
        print(base64Strings.privateKey)
    }
}
