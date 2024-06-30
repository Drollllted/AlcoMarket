//
//  MainView.swift
//  AlcoMarket
//
//  Created by Drolllted on 25.06.2024.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var searchCoctails: UITextField = {
        let text = UITextField()
        text.placeholder = "Search coctails..."
        text.borderStyle = .line
        text.font = .systemFont(ofSize: 18, weight: .bold)
        text.layer.cornerRadius = 15
        return text
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.purple.cgColor
        return button
    }()
    
    //MARK: - Stack Alco
    
    lazy var backgroundViewLayer: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var nameCoctailsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var ingredientsLabelName: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.underline()
        return label
    }()
    
    lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.numberOfLines = 5
        return label
    }()
    
    lazy var instructionLabelName: UILabel = {
        let label = UILabel()
        label.text = "Instruction"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.underline()
        return label
    }()
    
    lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(searchCoctails)
        addSubview(searchButton)
        addSubview(backgroundViewLayer)
        
        backgroundViewLayer.addSubview(nameCoctailsLabel)
        backgroundViewLayer.addSubview(ingredientsLabelName)
        backgroundViewLayer.addSubview(ingredientsLabel)
        backgroundViewLayer.addSubview(instructionLabelName)
        backgroundViewLayer.addSubview(instructionLabel)
        
    }
    
    private func constraintsUI() {
        searchCoctails.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self.snp.leading).inset(15)
            make.trailing.equalTo(self.snp.trailing).inset(15)
            make.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchCoctails.snp.bottom).offset(30)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        //MARK: - Setup Coctail Menu
        
        backgroundViewLayer.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(30)
            make.leading.equalTo(self.snp.leading).inset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.height.equalTo(350)
        }
        
        nameCoctailsLabel.snp.makeConstraints { make in
            make.leading.equalTo(backgroundViewLayer.snp.leading).inset(30)
            make.top.equalTo(backgroundViewLayer.snp.top).inset(30)
        }
        
        ingredientsLabelName.snp.makeConstraints { make in
            make.leading.equalTo(backgroundViewLayer.snp.leading).inset(30)
            make.top.equalTo(nameCoctailsLabel.snp.bottom).offset(30)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.leading.equalTo(backgroundViewLayer.snp.leading).inset(30)
            make.trailing.equalTo(backgroundViewLayer.snp.trailing).inset(20)
            make.top.equalTo(ingredientsLabelName.snp.bottom).offset(15)
        }
        
        instructionLabelName.snp.makeConstraints { make in
            make.leading.equalTo(backgroundViewLayer.snp.leading).inset(30)
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(30)
        }
        
        instructionLabel.snp.makeConstraints{ make in
            make.leading.equalTo(backgroundViewLayer.snp.leading).inset(30)
            make.top.equalTo(instructionLabelName.snp.bottom).offset(30)
        }
        
    }
    
}
