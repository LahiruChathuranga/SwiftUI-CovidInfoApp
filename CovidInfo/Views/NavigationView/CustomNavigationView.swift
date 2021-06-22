//
//  CustomNavigationView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/15/21.
//

import Foundation
import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    
    var view: HospitalInfoView
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let childView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: childView)
        
        controller.navigationBar.topItem?.title = "Covid-19"
        controller.navigationBar.prefersLargeTitles = true
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
}
