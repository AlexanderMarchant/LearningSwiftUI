//
//  CoffeeDetailView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct CoffeeDetailView: View {
    
    var drink: Drink
    
    var body: some View {
        
        List {
            
            ZStack(alignment: .bottom) {
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.25)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading, spacing: 20) {
                Text(drink.description)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineSpacing(12)
                    .lineLimit(nil)
                
                HStack {
                    Spacer()
                    OrderButton()
                    Spacer()
                }
            }
            .padding(.top)
            .padding(.bottom)
            
        }
        .navigationTitle(drink.name)
        .ignoresSafeArea(edges: .top)
    }
}

struct OrderButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Order")
                .font(.system(size: 20, weight: .semibold))
        })
        .frame(width: 200, height: 50)
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(5.0)
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(drink: Drink(id: 1001, name: "Test", imageName: "HotCoffee1", category: .hot, description: "Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing Testing"))
    }
}
