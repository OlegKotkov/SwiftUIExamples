//
//  ContentView.swift
//  Text
//
//  Created by mac on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Let's style our text views with fonts, colors and line spacing")
        //Расстояние между букв его добавляют в самое начало
        //.kerning(10)
        //или без пробела в конце
            .tracking(5)
        //для того чтобы определить количество строк
            .lineLimit(nil)
        //Варианты сокращения - выбор места сокращения
            .truncationMode(.middle)
        //Шрифт
            .font(.largeTitle)
        //Выравнивание
            .multilineTextAlignment(.center)
        //Фон
            .background(Color.green)
        //Цвет букв
            .foregroundColor(.blue)
        //Расстояние между строк
            .lineSpacing(50)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
