//
//  CoffeeMenuItem.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct CoffeeMenuItem: View {
    
    var drink: Drink
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(drink.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 150)
                .cornerRadius(15)
                .shadow(radius: 8)
            
            Text(drink.name)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.primary)
            Text(drink.description)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
}

struct CoffeeMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMenuItem(drink: Drink(id: 1001, name: "Test", imageName: "HotCoffee1", category: .hot, description: "This is a hot coffee with a very large amount of text so that we can see what happens when there is more than can fit onto the sreen"))
    }
}
