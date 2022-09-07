//
//  ContentView.swift
//  Form
//
//  Created by mac on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var colors = ["Red", "Green", "Blue "]
    @State private var selectedColors = 0
    @State private var aditionalSettings = false
    
    var body: some View {
        NavigationView{
            Form {
                //Оборачиваем одно из вью в секцию
                Section(header:  Text ("Colors")){
                Picker(selection: $selectedColors, label: Text("selected a color")) {
                    ForEach(0 ..< colors.count) {
                        Text(self.colors[$0])
                    }
                }
                }.pickerStyle(.segmented)
                Toggle(isOn: $aditionalSettings) {
                    Text("additional settings")
                }
                Button(action: {
                    //
                }) {
                    Text("сохранить изменения")
                    //Делаем кнопку не активной пока тогл выключен
                }.disabled(!aditionalSettings)
            } .navigationBarTitle("settings")
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
