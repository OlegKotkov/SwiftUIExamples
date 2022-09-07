
import SwiftUI
struct ContentView: View {
    // массив ассетов с методом перемешивания
    @State private var countries = ["USA", "Argentina", "China", "Cambodia", "SaintLucia", "Vatican", "Greenland", "Ecuador", "Uruguay"].shuffled()
    //Рандом из трех значений на привью
    @State private var currentAnswer = Int.random(in: 0...2)
    //Общий счет
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
            //метод для игнорировании незалитого пространства на экране
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack{
                    Text ("Выбери флаг:")
                        .foregroundColor(.white)
                        .font(.headline)
                    // Текст с названием страны, который отобр-ся рандомно
                    Text(countries[currentAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                //Внутри большого в-стэка размещаем три кнопки с флагами
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                        //модификатор для того чтобы отрисовывались оригинальные изображения ,а не кнопки
                            .renderingMode(.original)
                            .frame(width: 250, height: 125)
                        //помещаем в овальную капсулу
                            .clipShape(Capsule())
                        //делаем овальные рамки
                            .overlay(Capsule()
                                        .stroke(Color.black, lineWidth: 1))
                        //тень
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Общий счет: \(score) ")
                    .font(.largeTitle)
                    .fontWeight(.black)
                //Поднимаем флаги повыше
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Общий счет \(score)"), dismissButton: .default(Text("Продолжить")) {
                self.askQuestion()
            })
        }
        }
        //Функция для продожения игры после алерта
        func askQuestion() {
            countries.shuffle()
            currentAnswer = Int.random(in: 0...2)
        }
        //Функция нажания на кнопку(самое то главное)
        func flagTapped(_ number: Int) {
            if number == currentAnswer {
                scoreTitle = "Правильный ответ"
                score += 1
            } else {
                scoreTitle = "Не правильно. Это флаг \(countries[number])"
            }
        }
}
        
        
        
        
        
        
        
        
        
        
        
        
    
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
