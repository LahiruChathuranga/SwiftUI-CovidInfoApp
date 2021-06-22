//
//  LiveUpdateView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/13/21.
//

import ActivityIndicatorView
import SwiftUI

struct LiveUpdateView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: LiveInfoViewModel = LiveInfoViewModel()
    
    let gradient = Gradient(colors: [Color(UIColor(red: 0.39, green: 0.57, blue: 0.45, alpha: 1.00)), Color(UIColor(red: 0.86, green: 0.84, blue: 0.64, alpha: 1.00))])
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    InfoTileView(imageName: "patient", numberOfCases: viewModel.activeCases, title: "Active Cases", color: .red)
                    InfoTileView(imageName: "ambulance", numberOfCases: viewModel.dailyNewCases, title: "Daily New Cases", color: .purple)
                    
                    InfoTileView(imageName: "totalConfimed", numberOfCases: viewModel.totalConfirmedCases, title: "Total Confirmed Cases", color: .orange)
                    InfoTileView(imageName: "death", numberOfCases: viewModel.deaths, title: "Deaths", color: .red)
                    InfoTileView(imageName: "death", numberOfCases: viewModel.newDeaths, title: "New Deaths", color: .red)
                    
                    InfoTileView(imageName: "hospital", numberOfCases: viewModel.hospitalCases, title: "Investigations in hospitals", color: .purple)
                    InfoTileView(imageName: "running", numberOfCases: viewModel.recovered, title: "Recovered & Discharged", color: .green)
                    
                }
                
                ActivityIndicatorView(isVisible: $viewModel.isLoading, type: .default)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.green)
            }
        }.navigationBarBackButtonHidden(true)
        .navigationTitle(viewModel.date)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image("back")
                                        .resizable()
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.white)
                                })
                                
        )
    }
}

struct InfoTileView: View {
    
    let imageName: String
    let numberOfCases: String
    let title: String
    let color: Color
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .center)
                .foregroundColor(color)
                .padding(10)
            
            VStack(alignment: .leading) {
                Text(numberOfCases)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(color)
                    .lineLimit(2)
                
                
                Text(title)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .lineLimit(3)
                
                
            }.layoutPriority(100)
            
            Spacer()
            
        }.padding()
        .background(Color(UIColor.white))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                .shadow(radius: 10)
        )
        .padding([.top, .horizontal])
    }
}
