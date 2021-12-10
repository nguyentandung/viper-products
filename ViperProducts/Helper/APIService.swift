//
//  APIService.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit
import Alamofire

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: API_GET_TECHNOLOGY_PRODUCTS)!

    func apiToGetEmployeeData(completion : @escaping ([Product]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {

                let jsonDecoder = JSONDecoder()

                let products = try! jsonDecoder.decode([Product].self, from: data)
                    completion(products)
            }
        }.resume()
    }
    
    func getProducts(completion : @escaping ([Product]) -> ()) {
        AF.request(API_GET_TECHNOLOGY_PRODUCTS, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {(responseData) in
                guard let data = responseData.data else {
                    debugPrint("Cannot Connect API....")
                    return}
                do {
                 let products = try JSONDecoder().decode([Product].self, from: data)
                    debugPrint(products)
                    completion(products)
                } catch {
                    debugPrint(error)
                }

            }
    }
    
    func getColors(completion: @escaping ([Color]) -> ()) {
        AF.request(API_GET_COLORS, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {(responseData) in
                guard let data = responseData.data else {
                    debugPrint("Cannot Connect API....")
                    return}
                do {
                 let colors = try JSONDecoder().decode([Color].self, from: data)
                    debugPrint(colors)
                    debugPrint("Get list colors successfull")
                    completion(colors)
                } catch {
                    debugPrint(error)
                }

            }
    }
}


