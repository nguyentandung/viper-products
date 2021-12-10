//
//  ProductsPresent.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

class ProductsPresent : ListProductPresenterProtocol {
    var view: ListProductViewProtocol?
    
    var interactor: ListProductInteractorInputProtocol?
    
    var wireFrame: ListProductWireframeProtocol?
    
    func showProductSelection(with product: Product, from view: UIViewController) {
        
    }
    
    func requestToCallAPIGetProducts() {
        self.interactor?.getListProduct()
    }
    
    func requestToCallAPIGetColors() {
        debugPrint("Call Color")
        self.interactor?.getListColor()
    }
    
}

extension ProductsPresent : ListProductInteractorOutputProtocol {
    func listProductDidFetch(listProduct: [Product]) {
        debugPrint("Return products")
        self.view?.showProduct(with: listProduct)
    }
    
    func listColorDidFetch(listColor: [Color]) {
        self.view?.returnColorsResult(with: listColor)
    }
    
}
