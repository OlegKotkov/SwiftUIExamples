
import SwiftUI
//С помощью создания id и протокола делаем каждый айтом уникальным даже если пользователь повторится
struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}
class Expense: ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items){
                self.items = decoded
                return
            }
        }
    }
}
struct ContentView: View {
    @State private var showAddExpense = false
    @ObservedObject var expense = Expense()
    var body: some View {
        NavigationView{
            List{
                ForEach(expense.items){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("MyExpenses")
            .navigationBarItems(trailing:
                                    Button(action: {
                // тестовая затрата
//                let expense = ExpenseItem(name: "TEst", type: "", amount: 50)
//                self.expense.items.append(expense)
                self.showAddExpense = true
            }) {
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $showAddExpense){
                AddView(expenses: self.expense)
            }
        }
    }
    func removeItems(as offsets: IndexSet){
        expense.items.remove(atOffsets: offsets)
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
