
import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
         //Первый вариант работы с изображениями через асеты
         Image("image")
         // чтобы влезло в экран, но пропорции не сохранит
         .resizable()
         //чтобы с пропорциями
         .aspectRatio( contentMode: .fit)
         */
        //Второй вариант - SF Simbols(приложуха с иконками)Вызываем тоже через имя
        /*
         Image (systemName: "cloud.sun.fill")
         //мы можем редактировать их как обычный шрифт
         .font(.largeTitle)
         .padding(50)
         .background(Color.green)
         .foregroundColor(.blue)
         // Модификатор для изменения геометрии
         .clipShape(Circle())
         */
        //Использование модификатора background
        Text("Hello Swift!")
            //.background(Image("image")
        //фигура вместо картинки
            .background(Circle()
                            .fill(Color.green)
                                           .frame(width: 200, height: 200)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
