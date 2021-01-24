//
//  CoffeeMenuViewModel.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import Foundation


public class CoffeeMenuViewModel: ObservableObject {
    
    @Published var categories = [String: [Drink]]()
    
    let coffeeService: CoffeeServiceProtocol
    
    init(_ coffeeService: CoffeeServiceProtocol) {
        self.coffeeService = coffeeService
    }
    
    func getDrinks() {
        coffeeService.load("drinks.json", as: [Drink].self) { drinks in
            DispatchQueue.main.async {
                self.categories = .init(grouping: drinks, by: { $0.category.rawValue })
            }
        }
    }
}
