//
//  CelebrationAnimationView.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 16/04/24.
//

import UIKit
import Lottie

class CelebrationAnimationView: UIView {
    
    var animationView = LottieAnimationView()
    
    init(fileName: String) {
        let animation = LottieAnimation.named(fileName)
        self.animationView = LottieAnimationView(animation: animation)
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleToFill
        addSubview(animationView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            animationView.topAnchor.constraint(equalTo: topAnchor),
            animationView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
    func play(complete: @escaping (Bool) -> Void) {
        animationView.play(completion: complete)
    }
    
}
