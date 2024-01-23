//
//  Client.swift
//  ineed
//
//  Created by Bryan Cuadrado on 23/01/24.
//

import Foundation

struct Client: Identifiable {
    var id = UUID()
    var name: String
    var telephone: Int
    var direction: String
}
