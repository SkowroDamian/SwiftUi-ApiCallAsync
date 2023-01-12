 //
//  ContentView.swift
//  SwiftUI-ApiCallAsync
//
//  Created by Damian Skowroński on 22/12/2022.
//

import SwiftUI

// Model
//struct Joke: Codable {
//    var id: String
//    var joke: String
//    var status: String
//}

struct TaskEntry: Codable {
    let id: Int
    let title: String
}
//Vievmodel


struct ContentView: View {
    
@State var results = [TaskEntry]()
    
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
            }
        }.onAppear(perform: loadData)
    }
    
    
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
    
//    func fetchData() async {
//        //create url
//        guard let url = URL(string: "https://icanhazdadjoke.com/") else {
//            print("hey man this url doent work")
//            return
//        }
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.httpMethod = "GET"
//
//        //fetch data from api endpoint
//        do {
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data, let _ = response as? HTTPURLResponse, error == nil else {
//                    print("error")
//                    return
//                }
//                //decode that data
//                if let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data) {
//                    joke = decodedResponse
//                    print(joke)
//                }
//                print("test")
//            }
//        }
//    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let  joke2 = Joke(id: "1", joke: "adaf", status: "adfa")
        ContentView()
    }
}
