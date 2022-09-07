//
//  ContentView.swift
//  TextField
//
//  Created by mac on 29.07.2022.
//

import SwiftUI

struct ContentView: View {
    //Обычный текстфилд
    @State private var name = ""
    // Поле для пароля
    @State private var password = ""

    var body: some View {
        //Оборачиваем все в стэк тк возврвщвем более одного вью
        VStack{
        // placeholder
        TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            // Сразу можно добавить строку для отслеживания набираемого текста
         Text("Hello\(name)")
        
            //Поле для ввода параля
         SecureField("Enter your password", text: $password)
         Text("Your password\(password)")
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
