//
//  ProductsViewController.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var tblProducts: UITableView!
    
    var products = [Product]()
    var colors = [Color]()

    var presenter : ListProductPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewProduct()
        registerProtocol()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func configTableViewProduct() {
        self.tblProducts.separatorStyle = .none
        self.tblProducts.allowsSelection = false
        self.tblProducts.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func registerProtocol() {
//        ProductsRouter.createListProductModule(productListref: self)
        let presenter: ListProductPresenterProtocol & ListProductInteractorOutputProtocol = ProductsPresent()
        self.presenter = presenter
        self.presenter?.view = self
        self.presenter?.interactor = ProductsInteractor()
        self.presenter?.wireFrame = ProductsRouter()
        self.presenter?.interactor?.presenter = presenter
        let queue = DispatchQueue(label: "viper.demo")
        queue.sync {
            self.getColor()
        }
        queue.async {
            self.getProducts()
        }
    }
    
    func getProducts() {
        self.presenter?.requestToCallAPIGetProducts()
    }
    
    func getColor() {
        self.presenter?.requestToCallAPIGetColors()
    }
}

extension ProductsViewController : ListProductViewProtocol {
    func returnColorsResult(with colors: [Color]) {
        self.colors = colors
    }
    
    func showProduct(with products: [Product]) {
        debugPrint("Received products")
        self.products = products
        DispatchQueue.main.async {
            self.tblProducts.reloadData()
        }
    }
}

extension ProductsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblProducts.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = self.products[indexPath.row]
        cell.position = indexPath.row
        cell.product = product
        cell.colors = self.colors
        cell.setInformationItem()
        if product.image?.count == 0 {
            cell.imgItem.image = UIImage(named: IMAGE_DEFAULT)
        }else {
            cell.imgItem.loadImage(url: URL(string: product.image!)!)
        }
        
        if product.color == nil {
            cell.lblItemColor.text = "Undefined"
        }else {
           if let index = self.colors.firstIndex(where: {$0.id == product.color}) {
                cell.lblItemColor.text = colors[index].name
            }
        }
        return cell
    }
    
}
