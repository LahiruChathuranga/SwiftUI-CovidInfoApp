//
//  HomeView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/13/21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    let gradient = Gradient(colors: [Color(UIColor(red: 0.39, green: 0.57, blue: 0.45, alpha: 1.00)), Color(UIColor(red: 0.86, green: 0.84, blue: 0.64, alpha: 1.00))])
    var body: some View {
        NavigationView {
            ZStack {
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    SliderView()
                    
                    NavigationLink(
                        destination: LiveUpdateView(),
                        label: {
                            NavigationButton(title: "Sri Lanka's Live Update")
                        })
                    
                    NavigationLink(
                        destination: HospitalInfoView(),
                        label: {
                            NavigationButton(title: "Sri Lanka's Main Hospital's Live Update")
                        })
                }
            }
        }
    }
}

struct NavigationButton: View {
    
    let title: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 20) {
            HStack {
                Text(title)
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundColor(.black)
            }
            .frame(width: 300, height: 60, alignment: .center)
            .multilineTextAlignment(.center)
            .padding()
            .background(Color(UIColor.white))
            .cornerRadius(8)
        }
        .padding()
    }
}
