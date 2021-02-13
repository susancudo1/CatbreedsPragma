//
//  DetailView.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import SwiftUI

struct DetailView: View {

    @Environment(\.presentationMode) var presentationMode
    var cat: CatModel

    var body: some View {
        VStack {
            if cat.imageData != nil {
                Image(uiImage: UIImage(data: cat.imageData!)!)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "xmark.octagon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
            }

            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("detail_view_title_description".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(cat.description!)
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_country".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(cat.origin!)
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_intelligence".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text("\(cat.intelligence!)")
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_adaptability".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text("\(cat.adaptability!)")
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_life_span".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(cat.lifeSpan!)
                            .font(.system(.body, design: .rounded))
                    }
                    .padding()
                    Spacer()
                }
            }
        }.navigationBarTitle(cat.name!, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.body)
                .foregroundColor(.black)
        }))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(cat: CatModel())
    }
}
