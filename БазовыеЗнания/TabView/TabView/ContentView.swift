//
//  ContentView.swift
//  TabView
//
//  Created by mac on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    
@State private var selectedView = 1
    var body: some View {
        TabView(selection: $selectedView) {
            Text("first view")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }.tag(1)
            Text("SekondView")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }.tag(2)
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
