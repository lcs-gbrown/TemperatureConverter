//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by gabi brown on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    
    @State var celsius: Double = 10.0
    
    //MARK: Computed properties
    var fahrenheit: Double {
        return celsius * 1.8 + 32
    }
    
    var body: some View {
        VStack(alignment: .leading) {
          
            //Input
            Text("Temperature in Celsius:")
                .bold()
            
            
            Group {
                //Show the selected temperature value
                HStack {
                    Spacer()
                    Text("\(String(format: "%.1f", celsius))")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                //The syntax of $ says to use the property radius, and BIND it to this control
                //This value means when the control changes, the property's value changes
               Slider(value: $celsius,
                       in: 0.0...100.0,
                       label: {
                            Text("temperature")
                },
                       minimumValueLabel: {
                    Text("0.0")
                },
                       maximumValueLabel: {
                    Text("100.0")
                })

                
            }

            
            
            //Output
            Text("Fahrenheit")
                    .bold()
            
            Text("\(String(format:"%.1f",fahrenheit))")
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Converter")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
