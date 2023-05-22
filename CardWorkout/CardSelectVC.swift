//
//  ViewController.swift
//  CardWorkout
//
//  Created by Алишер Сайдешев on 22.05.2023.
//

import UIKit
import SnapKit

class CardSelectVC: UIViewController {

    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
    }

    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        
        cardImageView.image = UIImage(named: "AS")
        cardImageView.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(350)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-75)
        }
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        
        stopButton.snp.makeConstraints { make in
            make.width.equalTo(260)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(cardImageView.snp.bottom).inset(-30)
        }
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        
        resetButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(50)
            make.leading.equalTo(stopButton.snp.leading)
            make.top.equalTo(stopButton.snp.bottom).inset(-20)
        }
    }

    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        rulesButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(50)
            make.trailing.equalTo(stopButton.snp.trailing)
            make.top.equalTo(stopButton.snp.bottom).inset(-20)
        }
    }


}

