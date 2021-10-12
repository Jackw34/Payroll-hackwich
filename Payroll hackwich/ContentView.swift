//
//  ContentView.swift
//  Payroll hackwich
//
//  Created by Student on 9/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var hourlyWageTextField = ""
    @State private var hoursWorkedTextField = ""
    @State private var pay = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
                .padding()
            CustomTextField: "Hourly wage", variable: $hourlyWageTextField
            CustomTextField: "Hours Worked", variable: $hourlyWageTextField
            Button("Calculate") {
                pay()
                if let hourlyWage = Double(hourlyWageTextField) {
                    if let hoursWorked = Double(hoursWorkedTextField) {
                        pay = calculateGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                    }
                }
            }
            .padding()
            CustomText(text: "Gross Pay")
            CustomText(text: "$" + String(format: "%.2f",pay))
            Spacer()
        }
    }
    func calculateGrossPay(hourlyWage: Double, hoursWorked: Double) {
        var regularHours = 0.0
        var overTimePay = 0.0
        if hoursWorked > 40.0 {
            regularHours = 40
            overTimeHours = hoursWorked - 40
        }
        else {
            regularHours = hoursWorked
        }
        pay = (hourlyWage = overTimeHours * 1.5) + (hourlyWage * regularHours)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}

struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
    }
}
// 125
