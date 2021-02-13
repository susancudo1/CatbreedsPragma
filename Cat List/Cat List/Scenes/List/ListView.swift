//
//  ContentView.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import SwiftUI

struct ListView: View {
    var viewModel = ListViewModel()
    @State private var searchText = ""
    @State private var arrayCats = [CatModel]()
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(.top)
                List(arrayCats.filter({ searchText.isEmpty ?
                                        true : $0.name!.lowercased().contains(searchText.lowercased()) }),
                     id: \.iden) { cat in
                    ZStack {
                        CardView(breedName: cat.name!,
                                 countryOrigin: cat.origin!,
                                 intelligence: "\(cat.intelligence!)",
                                 imageData: cat.imageData)
                        NavigationLink(destination: DetailView(cat: cat)) {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationBarTitle("title_app".localized, displayMode: .inline)
        }
        .onAppear {
            self.viewModel.search { (cats) in
                guard let catsArray = cats else {
                    return
                }
                self.arrayCats = catsArray
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
