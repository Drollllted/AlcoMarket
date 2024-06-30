//
//  APIRequest.swift
//  AlcoMarket
//
//  Created by Drolllted on 24.06.2024.
//

import Foundation
import Alamofire

class APIRequest {
    static let shared = APIRequest()
    private let httpApi = "https://api.api-ninjas.com/v1/cocktail?name="
    private let apiKey = "er483/072QGJ8Y+cyVY9ZA==BtxTfeHFd2FLF6jx"
    
    private init(){}
    
    
    
    func getCoctails(nameCoctails: String, completion: @escaping (String?, String?, [String?]) -> Void) {
        let name = nameCoctails.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let name = name else {return}
        AF.request(httpApi + name, method: .get, headers: ["X-Api-Key": apiKey]).validate(statusCode: 200..<300).responseData { response in
            switch response.result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([JSONCaller].self, from: data)
                    guard let jsonFirst = json.first else {return }
                    print(jsonFirst)
                    
                    let firstIngredients = jsonFirst.ingredients
                    let firstInstruction = jsonFirst.instructions
                    let firstName = jsonFirst.name
                    
                    let ingredientsJoined = firstIngredients.joined(separator: ", ")
                    completion(firstName, firstInstruction, [ingredientsJoined])
                    
                } catch {
                    debugPrint(error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
