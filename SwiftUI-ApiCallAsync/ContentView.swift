 //
//  ContentView.swift
//  SwiftUI-ApiCallAsync
//
//  Created by Damian Skowroński on 22/12/2022.
//

import SwiftUI

// Model
struct Quote: Codable {
    var quote_id: Int
    var quote: String
    var author: String
    var series: String
}
//Vievmodel

            
struct ContentView: View {
    @State private var quotes = [Quote]()
    
    var body: some View {
        List(quotes, id: \.quote_id) { quote in
            VStack(alignment: .leading) {
                Text(quote.author)
                    .font(.headline)
                Text(quote.quote)
                    .font(.body)
            }
        }
    }
    
    func fetchData() async {
        //create url
        guard let url = 
        
        //fetch data from api endpoint
        
        //decode thatt data
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
