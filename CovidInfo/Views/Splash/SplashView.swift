//
//  SplashView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/14/21.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    let gradient = Gradient(colors: [Color(UIColor(red: 0.39, green: 0.57, blue: 0.45, alpha: 1.00)), Color(UIColor(red: 0.86, green: 0.84, blue: 0.64, alpha: 1.00))])
    
    var body: some View {
        VStack {
            if self.isActive {
                HomeView()
            } else {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("corona_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}
