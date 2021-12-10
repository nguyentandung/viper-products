//
//  ProductsInteractor.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

class ProductsInteractor : ListProductInteractorInputProtocol {
    var presenter: ListProductInteractorOutputProtocol?
    
    func getListProduct() {
        callAPIToGetProduct()
    }
    
    func getListColor() {
        callAPIToGetColor()
    }
    
    func callAPIToGetProduct() {
        debugPrint("Prepare Call API")
        let apiService = APIService()
        apiService.getProducts { (empData) in
            debugPrint("Call API Success")
            self.presenter?.listProductDidFetch(listProduct: empData)
        }
    }
    
    func callAPIToGetColor() {
         let apiService = APIService()
         apiService.getColors { (colors) in
            self.presenter?.listColorDidFetch(listColor: colors)
        }
    }
    
}




