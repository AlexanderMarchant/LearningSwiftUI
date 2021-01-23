//
//  ContentView.swift
//  LearningSwiftUI
//
//  Created by Alex Marchant on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    let breakDowns = ["Daily", "Monthly", "Yearly"]
    let savePercentages = [5, 10, 20, 30, 40, 50]
    
    @State var enteredSalary: String = ""
    @State var salaryBreakdown = 0
    @State var salarySavePercentage = 0
    
    var finalPreTaxSalaryAmount: Double {
        return calculatePreTaxAmount() / calculateBreakdown()
    }
    
    var finalPostTaxSalaryAmount: Double {
        
        let totalPreTax = self.calculatePreTaxAmount()
        
        var postTaxAmount: Double = 0
        
        if(totalPreTax > 12500) {
            postTaxAmount += 12500
            var taxableAmount = totalPreTax - 12500
            
            // 50% Tax Bracket
            if(taxableAmount > 137500) {
                let fiftyPercentTaxBracketTaxableAmount = taxableAmount - 137500
                
                taxableAmount -= fiftyPercentTaxBracketTaxableAmount
                
                print("BEFORE 50%: \(postTaxAmount)")
                postTaxAmount += (fiftyPercentTaxBracketTaxableAmount * 0.50)
            }
            
            // 40% Tax Bracket
            if(taxableAmount > 37500) {
                let fourtyPercentTaxBracketTaxableAmount = taxableAmount - 37500
                
                taxableAmount -= fourtyPercentTaxBracketTaxableAmount
                
                print("BEFORE 40%: \(postTaxAmount)")
                postTaxAmount += (fourtyPercentTaxBracketTaxableAmount * 0.60)
                
            }
            
            print(taxableAmount)
            print("BEFORE 20%: \(postTaxAmount)")
            // 20% Tax Bracket
            postTaxAmount += taxableAmount * 0.80
        } else {
            postTaxAmount = totalPreTax
        }
        
        print("BEFORE BREAKDOWN: \(postTaxAmount)")
        return postTaxAmount / self.calculateBreakdown()
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    
                    TextField("Enter your current yearly salary", text: $enteredSalary)
                        .keyboardType(.numberPad)
                    
                    Picker("Salary Breakdown", selection: $salaryBreakdown) {
                        ForEach(0..<breakDowns.count) {
                            Text(self.breakDowns[$0])
                        }
                    }
                    
                }
                
                Section(header: Text("How much do you want to save?")) {
                    
                    Picker("Save Percentage", selection: $salarySavePercentage) {
                        ForEach(0..<savePercentages.count) {
                            Text("\(self.savePercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Salary Calculations")) {
                    Text("Pre-tax (\(breakDowns[self.salaryBreakdown])): \(finalPreTaxSalaryAmount, specifier: "%.2f")")
                    
                    Text("Post-tax (\(breakDowns[self.salaryBreakdown])): \(finalPostTaxSalaryAmount, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Salary Calculator")
        }
    }
    
    func calculateBreakdown() -> Double {
        
        var salaryBreakdownValue = 1.0
        
        switch self.salaryBreakdown {
        case 0:
            // (Daily) Working days in the UK in a year
            salaryBreakdownValue = 256.0
        case 1:
            // (Monthly)
            salaryBreakdownValue = 12
        default:
            salaryBreakdownValue = 1.0
        }
        
        return salaryBreakdownValue
    }
    
    func calculatePreTaxAmount() -> Double {
        
        let savePercentageValueDouble = Double(savePercentages[salarySavePercentage])
        
        let salaryAmountValueDouble = Double(enteredSalary) ?? 0
        
        let saveAmountValueDouble = (salaryAmountValueDouble / 100) * savePercentageValueDouble
        
        let salaryAmountTotalValueDouble = salaryAmountValueDouble - saveAmountValueDouble
        
        return salaryAmountTotalValueDouble
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
