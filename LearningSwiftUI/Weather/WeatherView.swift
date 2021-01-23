//
//  WeatherView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 23/01/2021.
//

import SwiftUI

struct WeatherView: View {
    
    let blue = Color(UIColor(red: 13/255, green: 131/255, blue: 255/255, alpha: 1))
    let lightBlue = Color(UIColor(red: 42/255, green: 148/255, blue: 248/255, alpha: 1))
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [lightBlue, blue]),
                    startPoint: .top,
                    endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.cityName)
                    .font(.largeTitle)
                Text(viewModel.temperature)
                    .font(.system(size: 50))
                    .bold()
                Text(viewModel.weatherIcon)
                    .font(.largeTitle)
                Text(viewModel.description)
            }
            .foregroundColor(.white)
            .onAppear(perform: {
                viewModel.refresh()
            })
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(WeatherService()))
    }
}

