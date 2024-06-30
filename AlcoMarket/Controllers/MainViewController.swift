//
//  ViewController.swift
//  AlcoMarket
//
//  Created by Drolllted on 23.06.2024.
//

import UIKit

@MainActor
class MainViewController: UIViewController {
    
    private let apiRequest = APIRequest.shared
    private var mainView: MainView!
    var coctailsNameSearch: String = ""
    
    override func loadView() {
        mainView = MainView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Cocktails"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]
        
        mainView.searchButton.addTarget(self, action: #selector(touchSearch), for: .touchUpInside)
        
    }
    
    @objc func touchSearch() {
        getCoctails()
    }
    
    private func getCoctails() {
        apiRequest.getCoctails(nameCoctails: coctailsNameSearch, completion: { [weak self] name, instruction, ingredients in
            guard let self = self else {return}
            var coctailsName = coctailsNameSearch.lowercased()
            guard coctailsName == self.mainView.searchCoctails.text else {return}
                self.mainView.nameCoctailsLabel.text = coctailsName
                self.mainView.instructionLabel.text = instruction
                
                if !ingredients.isEmpty {
                    let nonOptionalIngredients = ingredients.compactMap { $0 }
                    let joinedIngredients = nonOptionalIngredients.joined(separator: ", ")
                    self.mainView.ingredientsLabel.text = joinedIngredients
                } else {
                    self.mainView.ingredientsLabel.text = "No ingredients available"
                }
            

        })
        
        
    }


}

