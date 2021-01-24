//
//  CoffeeService.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import Foundation

protocol CoffeeServiceProtocol {
    func load<T: Decodable>(_ filename: String, as type: T.Type, completionHandler: @escaping(T) -> Void)
}

class CoffeeService: CoffeeServiceProtocol {
    
    init() { }
    
    func load<T: Decodable>(_ filename: String, as type: T.Type = T.self, completionHandler: @escaping(T) -> Void) {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            completionHandler(try decoder.decode(T.self, from: data))
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
