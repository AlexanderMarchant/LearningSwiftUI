//
//  Drink.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct Drink: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var description: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case hot = "Hot"
        case cold = "Cold"
    }
    
}
