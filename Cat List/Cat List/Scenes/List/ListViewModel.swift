//
//  ListViewModel.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

class ListViewModel {

    var breedsWorker = BreedsWorker()
    var downloadImageWorker = DownloadImageWorker()

    func search(completion: @escaping ([CatModel]?) -> Void) {
        // Busca el producto en el servicio expuesto
        self.breedsWorker.getSearch { (success, cats) in
            if success {

                guard cats!.count > 0 else {
                    completion(nil)
                    return
                }
                if var newCats = cats {
                    // Por cada producto encontrado se busca su imagen
                    for index in 0...newCats.count - 1 {
                        self.downloadImageWorker.getImage(newCats[index]) { (success, imageData) in
                            if success {
                                newCats[index].imageData = imageData

                            }
                            completion(newCats)
                        }
                    }

                }
            } else {
                completion(cats)
            }
        }
    }
}
