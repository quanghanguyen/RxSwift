//
//  ProductViewModel.swift
//  RxSwift
//
//  Created by Nguyen Quang Ha on 10/10/2022.
//

import Foundation

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
            Product(imageName: "house", title: "Home")
            Product(imageName: "gear", title: "Settings")
            Product(imageName: "person.circle", title: "Profile")
            Product(imageName: "airplane", title: "Flights")
            Product(imageName: "bell", title: "Activity")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}
