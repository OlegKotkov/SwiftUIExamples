//
//  ContentView.swift
//  @State
//
//  Created by mac on 29.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var showHello = true
    
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $showHello) {
                Text("Show Hello")            }.padding()
            if showHello   {
                Text("Hello")
            }
        }
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
