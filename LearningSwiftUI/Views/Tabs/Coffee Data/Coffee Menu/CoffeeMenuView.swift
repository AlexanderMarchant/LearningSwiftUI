//
//  CoffeeMenuView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct CoffeeMenuView: View {
    
    @ObservedObject var viewModel: CoffeeMenuViewModel
    
    var body: some View {
        
        NavigationView {
            
            List(viewModel.categories.keys.sorted(), id: \String.self) { key in
                CoffeeMenuRowView(categoryName: "\(key) Drinks", drinks: viewModel.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .background(Color.clear)
            .navigationBarTitle("Coffee Menu")
            
        }
        .onAppear(perform: {
            viewModel.getDrinks()
        })
    }
}

struct CoffeeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMenuView(viewModel: CoffeeMenuViewModel(CoffeeService()))
    }
}
