//
//  CardView.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import SwiftUI

struct CardView: View {

    var breedName: String
    var countryOrigin: String
    var intelligence: String
    var imageData: Data?

    var body: some View {
        VStack {
            HStack {
                Text(breedName)
                    .padding()

                Spacer()

                Text("card_view_more".localized)
                    .padding()
            }
            if imageData != nil {
                Image(uiImage: UIImage(data: imageData!)!)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "xmark.octagon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
            }

            HStack {
                Text(countryOrigin)
                    .padding()

                Spacer()

                Text(intelligence)
                    .padding()
            }
        }
        .border(Color.black, width: 1)
        .padding( [ .top, .horizontal ] )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(breedName: "Nombre Raza",
                 countryOrigin: "Pais de origen",
                 intelligence: "Inteligencia",
                 imageData: Data())
    }
}
