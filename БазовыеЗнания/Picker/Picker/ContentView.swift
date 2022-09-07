//
//  ContentView.swift
//  Picker
//
//  Created by mac on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
    
var color = ["red", "blue", "green", "black", "white"]

@State private var selectedColor = 0
    var body: some View {
        VStack {
            Picker(selection: $selectedColor,
                   label: Text("Choose color")) {
                ForEach(0..<color.count) {
                    index in
                    Text(self.color[index])
                }
            }.pickerStyle(.wheel)
            Text("You selected: \(color[selectedColor])")
            
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
