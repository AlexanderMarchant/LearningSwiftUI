//
//  WeatherViewModel.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 23/01/2021.
//

import Foundation

private let defaultIcon = "❓"
private let weatherIconMap =  [
    "rizzle" : "🌧",
    "thunderstorm" : "⚡️",
    "rain" : "☔️",
    "snow" : "☃️",
    "clear" : "☀️",
    "clouds" : "☁️"
]

public class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "---"
    @Published var description: String = "---"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(_ weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData({ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.description = weather.description.capitalized
                self.weatherIcon = weatherIconMap[weather.iconName.lowercased()] ?? defaultIcon
            }
        })
    }
    
}
