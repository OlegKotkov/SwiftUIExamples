//
//  ContentView.swift
//  Slider
//
//  Created by mac on 30.07.2022.
//

import SwiftUI
struct ContentView: View {
    @State private var celsius: Double = 0
    var body: some View {
        VStack{
            Slider(value: $celsius, in: -100...100, step: 0.1)
            
            //Переводим цельсии в фаренгейты
            Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
