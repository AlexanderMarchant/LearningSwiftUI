//
//  WeatherService.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 23/01/2021.
//

import CoreLocation
import Foundation

public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    private var completionHandler: ((Weather) -> Void)?
    let apiKey = "051bc0a9e98b0a9bc099b8f33ed700ce"
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func getData(forCoordinates coordinates: CLLocationCoordinate2D) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  error == nil,
                  httpResponse.statusCode == 200 else {
                print("Something went wrong!!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let decodedData = try decoder.decode(APIResponse.self, from: data)
                
                self.completionHandler?(Weather(response: decodedData))
            } catch {
                print("Something went wrong!!")
            }
                  
        }
        
        task.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        getData(forCoordinates: location.coordinate)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
