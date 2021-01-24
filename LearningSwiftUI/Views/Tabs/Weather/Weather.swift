//
//  Weather.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 23/01/2021.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: Int
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        self.city = response.name
        self.temperature = Int(response.main.temp)
        self.description = response.weather.first?.description ?? ""
        self.iconName = response.weather.first?.iconName ?? ""
    }
    
    
}


