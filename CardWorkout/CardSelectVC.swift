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
    
    var cards = CardDeck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
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
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        stopButton.snp.makeConstraints { make in
            make.width.equalTo(260)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(cardImageView.snp.bottom).inset(-30)
        }
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        resetButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(50)
            make.leading.equalTo(stopButton.snp.leading)
            make.top.equalTo(stopButton.snp.bottom).inset(-20)
        }
    }

    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        rulesButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(50)
            make.trailing.equalTo(stopButton.snp.trailing)
            make.top.equalTo(stopButton.snp.bottom).inset(-20)
        }
    }

    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    

}

