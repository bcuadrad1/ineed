//
//  Business.swift
//  ineed
//
//  Created by Bryan Cuadrado on 23/01/24.
//

import Foundation

struct Business: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var telephone: String
    var img: String
    var stars: Int
    var category: Category
}
