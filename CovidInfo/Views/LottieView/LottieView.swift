//
//  LottieView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/14/21.
//

import UIKit
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var lottieName: String = ""
    
    init(lottieName: String) {
        self.lottieName = lottieName
    }
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        // Add animation
        let animationView = AnimationView()
        animationView.animation = Animation.named(lottieName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // do nothing
    }
}
