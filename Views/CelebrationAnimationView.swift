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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
