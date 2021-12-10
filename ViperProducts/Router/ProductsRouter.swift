//
//  ProductsRouter.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit


class ProductsRouter : ListProductWireframeProtocol {
    func pushtoProductDetail(with product: Product, from view: UIViewController) {
        
    }
    
    static func createListProductModule(productListref: ProductsViewController) {
        let presenter: ListProductPresenterProtocol & ListProductInteractorOutputProtocol = ProductsPresent()
        productListref.presenter = presenter
        productListref.presenter?.interactor?.presenter = presenter
        productListref.presenter?.wireFrame = ProductsRouter()
        productListref.presenter?.view = productListref
        productListref.presenter?.interactor = ProductsInteractor()
    }
    
}
