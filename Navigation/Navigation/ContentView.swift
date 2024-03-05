//
//  ContentView.swift
//  Navigation
//
//  Created by Ваня Науменко on 5.03.24.
//

import SwiftUI
@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoder = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoder)
                return
            }
        }
        path = NavigationPath()
    }
    func save() {
        guard let representation = path.codable else {return}
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    func clear() {
        
    }
}
// MARK: - DetailView

struct DetailView: View {
    var number: Int
//    @Binding var path: [Int]
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1 ... 10)) 
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    
                    PathStore().clear()
                }
            }
    }
}

// MARK: - ContentView

struct ContentView: View {
    @State private var pathStore = PathStore()
//    @State private var path = NavigationPath()
    var body: some View {
        VStack {
            NavigationStack(path: $pathStore.path) {
                DetailView(number: 0)
                    .navigationDestination(for: Int.self) { i in
                        DetailView(number: i)
                    }
            }
            Image("image")
                .resizable()
                .ignoresSafeArea()
                .scaledToFit()
                
        }
        
    }
}

#Preview {
    ContentView()
}
