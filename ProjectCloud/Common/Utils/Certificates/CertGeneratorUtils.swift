//
//  CertGeneratorUtils.swift
//  ProjectCloud
//
//  Created by Sinisa Abramovic on 02.07.2023..
//

import Crypto
import Foundation
import SwiftASN1
import X509

final class CertGeneratorUtils {
    
    // MARK: - Public methods -
    
    static func generateCertificateAndKey() throws -> (certificate: Data, privateKey: Data) {
        
        let swiftCryptoKey = P256.Signing.PrivateKey()
        let key = Certificate.PrivateKey(swiftCryptoKey)
        
        let subjectName = try DistinguishedName {
            CommonName("CommonName subject - WIP")
        }
        let issuerName = subjectName
        
        let now = Date()
        
        let extensions = try Certificate.Extensions {
            Critical(
                BasicConstraints.isCertificateAuthority(maxPathLength: nil)
            )
            Critical(
                KeyUsage(keyCertSign: true)
            )
            SubjectAlternativeNames([.dnsName("localhost")])
        }
        
        let certificate = try Certificate(
            version: .v3,
            serialNumber: Certificate.SerialNumber(),
            publicKey: key.publicKey,
            notValidBefore: now,
            notValidAfter: now.addingTimeInterval(60 * 60 * 24 * 365),
            issuer: issuerName,
            subject: subjectName,
            signatureAlgorithm: .ecdsaWithSHA256,
            extensions: extensions,
            issuerPrivateKey: key
        )
        
        var serializer = DER.Serializer()
        try serializer.serialize(certificate)
        
        let derEncodedCertificate = Data(serializer.serializedBytes)
        let derEncodedPrivateKey = swiftCryptoKey.derRepresentation
        
        return (derEncodedCertificate, derEncodedPrivateKey)
    }
    
    static func certAndKeyInBase64EncodedStrings(
        from dataTuple: (certificate: Data, privateKey: Data)
    ) -> (certificate: String, privateKey: String) {
        let base64Certificate = dataTuple.certificate.base64EncodedString()
        let base64PrivateKey = dataTuple.privateKey.base64EncodedString()
        
        return (base64Certificate, base64PrivateKey)
    }
}
