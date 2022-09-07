import SwiftUI
struct ContentView: View {
    @State var posts: [Post] = []
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack{
                    Text(post.title)
                        .fontWeight(.bold)
                    Text(post.body)
                }
                //чтобы все данные подгружались, когда приложение запустилось
            }.onAppear() {
                Api().getPost { (posts) in
                    self.posts = posts
                }
            }.navigationTitle("Posts")
        }
    }
}
//Создаем модель данных
struct Post: Codable, Identifiable {
    var id = UUID()
    var title: String
    var body: String
}
//создаем сессию для этого
class Api {
    func getPost(completion: @escaping ([Post]) -> ()){
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = ["authToken" : "nil"]
        urlRequest.httpMethod = "Get"
        let task = URLSession.shared.dataTask(with: urlRequest) {data, responce, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode(Post.self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch {
                   print(error)
                }
            }
        
        /*
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
         */
        
       task.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
