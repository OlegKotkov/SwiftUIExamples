//
//  ContentView.swift
//  Stepper
//
//  Created by mac on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
    
     @State private var age = 18
    var body: some View {
        VStack{
            Stepper("Enter your age", onIncrement: {
                self.age += 1
                print("Adding to age")
            },onDecrement: {
                self.age -= 1
                print("Substracting for age")
            })
            Text("You age: \(age)")
            
        }
        
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
