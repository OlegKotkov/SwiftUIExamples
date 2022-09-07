import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    // выбор процента
    let tipPercentages = [0, 5, 10, 15, 20, 30]
    // Вычисляемое свойство для получения суммы
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        //Если пользователь будет вводить буквы вместо цифр, то будет 0, это просто проверка на нил
        let orderAmount = Double(checkAmount) ?? 0
        // вычисляем процент от суммы
        let tipValue = orderAmount / 100 * tipSelection
        //итоговая сумма(чек + чаевые)
        let grandTotal = orderAmount + tipValue
        //Сумма на человека
        let amountPerPerson = grandTotal / peopleCount
    //возвращаем
    return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach (2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text ("Сколько чаевых вы хотите оставить?")){
                    Picker("Percentage", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    //выводим сумму с ограничением знаков после ноля до двух
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
