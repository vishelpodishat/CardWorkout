//
//  CWButton.swift
//  CardWorkout
//
//  Created by Алишер Сайдешев on 22.05.2023.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    func configure() {
        layer.cornerRadius = 8
        clipsToBounds = true
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        setTitleColor(.white, for: .normal)
    }

}
