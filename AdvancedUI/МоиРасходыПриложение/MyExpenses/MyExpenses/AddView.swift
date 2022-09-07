

import SwiftUI
struct AddView: View {
    //Для автоматического перехода на первое вью после сохранения 
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expense
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    let types = ["Bussines", "Personal"]
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker(selection: $type, label: Text("Type")) {
                    ForEach(self.types, id: \.self){
                      Text($0)
                    }
                }
                TextField("Summ", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add")
            .navigationBarItems(trailing: Button("Save"){
                //Проверяем на нил и приводим к интеджер строку
                if let actualAmount = Int(self.amount){
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    //Для автоматического перехода на первое вью после сохранения
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expense())
    }
}
