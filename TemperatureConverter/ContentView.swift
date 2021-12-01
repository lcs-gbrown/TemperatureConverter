//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by gabi brown on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    
    @State var feedback = ""
    
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
                       in: -50.0...50.0,
                       label: {
                    Text("temperature")
                },
                       minimumValueLabel: {
                    Text("-50.0")
                },
                       maximumValueLabel: {
                    Text("100.0")
                })
                
                Button(action: {
                    
                    //Create a temporary constant witha gess as an integer
                    let celsiusInteger = Int(celsius)
                    
                    //Check the users guess
                    if celsiusInteger > 50 {
                    feedback = "It's boiling. Drink lots of water and wear sunscreen"
                } else if celsiusInteger > 30 {
                    feedback = "It's balmy! Tee-shirt and shorts weather!"
                } else if celsiusInteger > 10 {
                    feedback = "Just wear a long sleeve"
                } else if celsiusInteger < 9 {
                    feedback = "It's chilly. Wear a little jacket."
                } else if celsiusInteger < 0 {
                    feedback = "It's cold. Dress warm."
                } else if celsiusInteger < 20 {
                    feedback = "It's freezing. Lots of layers!"
                }
                       
                       print("Button was pressed")
                       }, label: {
                    Text("Submit Temperature")
                })
                    .buttonStyle(.bordered)
                
                
                
                Text("\(feedback)")
                    .italic()
                    .padding()
                
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
