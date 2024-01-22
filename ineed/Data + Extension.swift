//
//  Data + Extension.swift
//  ineed
//
//  Created by Bryan Cuadrado on 22/01/24.
//

import Foundation
extension Data {
    func toString() -> String {
        /// parsed solution found in
        /// https://stackoverflow.com/questions/9372815/how-can-i-convert-my-device-token-nsdata-into-an-nsstring
        let token = self.map { data in String(format: "%02.2hhx", data) }
        return token.joined()
    }
}
