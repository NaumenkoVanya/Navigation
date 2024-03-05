//
//  ContentView45Day.swift
//  Navigation
//
//  Created by Ваня Науменко on 5.03.24.
//

import SwiftUI

struct ContentView45Day: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
           
            Text("Hello World")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
//            List(0..<100){ i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark)
//            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView45Day()
}
