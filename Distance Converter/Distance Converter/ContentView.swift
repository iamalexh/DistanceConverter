//
//  ContentView.swift
//  Distance Converter
//
//  Created by Alex on 01/08/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var distance = ""
    @State private var unitIn = 2
    @State private var unitOut = 2
    
 let units = ["MM", "CM", "M", "INCHES", "FEET"]
    
    var convertedTotal: Double {
            let number = Double(distance) ?? 0
        var inMM = 0.0
        var finalDist = 0.0

            switch unitIn {
            case 1:
                inMM = number * 10
            case 2:
                inMM = number * 1000
            case 3:
                inMM = number * 25.4
            case 4:
                inMM = number * 304.8
            default:
                inMM = number
            }

            switch unitOut {
            case 1:
                finalDist = inMM / 10
            case 2:
                finalDist = inMM / 1000
            case 3:
                finalDist = inMM / 25.4
            case 4:
                finalDist = inMM / 304.8
            default:
                finalDist = inMM
            }

            return finalDist
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                  TextField("Distance", text: $distance)
                     .keyboardType(.decimalPad)
                   
                    Picker ("Unit Type", selection: $unitIn) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Select Target Unit")) {
                    Picker ("Unit Type", selection: $unitOut) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("New Distance in selected Unit")){Text("\(convertedTotal, specifier: "%.3g")")}
            }
            .navigationBarTitle("Converter")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
