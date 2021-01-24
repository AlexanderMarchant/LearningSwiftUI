//
//  TabView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 24/01/2021.
//

import SwiftUI

struct TabView: View {
    
    let tabBarStrings = ["Salary", "Weather", "Coffee"]
    let tabBarIcons = ["briefcase", "cloud.sun", "house"]
    @State private var selectedIndex = 1
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                
                    switch selectedIndex {
                    case 0:
                        SalaryCalculatorView()
                    case 1:
                        let weatherService = WeatherService()
                        let weatherViewModel = WeatherViewModel(weatherService)
                        WeatherView(viewModel: weatherViewModel)
                    case 2:
                        NavigationView {
                            SalaryCalculatorView()
                        }
                    default:
                        NavigationView {
                            SalaryCalculatorView()
                        }
                    }
            }
            
            Divider()
        
            HStack {
                ForEach(0..<3) { num in
                    
                    Button(action: {
                        self.selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        VStack(spacing: 5) {
                            Image(systemName: tabBarIcons[num])
                                .font(.system(size: 25, weight: .medium))
                            Text(tabBarStrings[num])
                                .font(.system(size: 15, weight: .medium))
                        }
                        .foregroundColor(selectedIndex == num ? Color.black : .init(white: 0.8))
                        
                        Spacer()
                    })
                    
                }
            }
            .padding(.top, 15)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
