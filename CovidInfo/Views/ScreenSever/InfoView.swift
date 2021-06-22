//
//  InfoView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/14/21.
//

import Foundation
import SwiftUI

struct SliderView: View {
    var body: some View {
        TabView {
            PageView(lottieName: "stayathome", showDissmissButton: false)
            
            PageView(lottieName: "usemask", showDissmissButton: false)
            
            PageView(lottieName: "washhands", showDissmissButton: false)
            
            PageView(lottieName: "usehandsanitizer", showDissmissButton: false)
            
            PageView(lottieName: "distance", showDissmissButton: false)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct PageView: View {
    
    let lottieName: String
    let showDissmissButton: Bool
    
    var body: some View {
        
        ZStack {
            Color(UIColor.clear)
            
            VStack {
                LottieView(lottieName: lottieName)
                    .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

