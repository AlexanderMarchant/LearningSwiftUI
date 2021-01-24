//
//  CoffeeMenuRowView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct CoffeeMenuRowView: View {
    
    var categoryName: String
    var drinks: [Drink]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(categoryName)
                .font(.system(size: 26, weight: .bold))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.drinks, id: \.id) { drink in
                        
                        NavigationLink(destination: CoffeeDetailView(drink: drink)) {
                            
                            CoffeeMenuItem(drink: drink)
                                .frame(width: 250)
                                .padding(.trailing, 25)
                        }
                    }
                }
            }
        }
    }
}

struct CoffeeMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMenuRowView(
            categoryName: "Hot Drinks",
            drinks: [
                Drink(
                    id: 1001,
                    name: "Test",
                    imageName: "HotCoffee1",
                    category: .hot,
                    description: "Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing"
                ),
                Drink(
                    id: 1002,
                    name: "Test",
                    imageName: "HotCoffee2",
                    category: .hot,
                    description: "Test2"
                ),
                Drink(
                    id: 1003,
                    name: "Test",
                    imageName: "HotCoffee3",
                    category: .hot,
                    description: "Test3"
                )
            ]
        )
    }
}
