//
//  Protocol.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

protocol ListProductViewProtocol: class{
    func showProduct(with products: [Product])
    func returnColorsResult(with colors: [Color])
}

protocol ListProductInteractorInputProtocol:class {
    var presenter:ListProductInteractorOutputProtocol? { get set }
    func getListProduct()
    func getListColor()
}

protocol ListProductInteractorOutputProtocol: class {
    func listProductDidFetch(listProduct: [Product] )
    func listColorDidFetch(listColor: [Color] )
}

protocol ListProductPresenterProtocol: class  {
    var view:ListProductViewProtocol? { get set }
    var interactor:ListProductInteractorInputProtocol? { get set }
    var wireFrame:ListProductWireframeProtocol? { get set }
    func showProductSelection(with product: Product, from view: UIViewController)
    func requestToCallAPIGetProducts()
    func requestToCallAPIGetColors()
}

protocol ListProductWireframeProtocol: class {
    func pushtoProductDetail(with product: Product,from view: UIViewController )
    static func createListProductModule(productListref: ProductsViewController)
}

