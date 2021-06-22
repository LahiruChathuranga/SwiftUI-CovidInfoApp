//
//  HosptalInfoView.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/13/21.
//

import Foundation
import SwiftUI
import ActivityIndicatorView

struct HospitalInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: LiveInfoViewModel = LiveInfoViewModel()
    @State private var searchText = ""
    
    let gradient = Gradient(colors: [Color(UIColor(red: 0.39, green: 0.57, blue: 0.45, alpha: 1.00)), Color(UIColor(red: 0.86, green: 0.84, blue: 0.64, alpha: 1.00))])
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    SearchBar(text: $searchText)
                    
                    ForEach(viewModel.hospitalInfo?.filter { $0.hospital?.name?.lowercased().contains(searchText.lowercased()) ?? false || searchText.isEmpty } ?? []) { info in
                        HospitalInfoRow(hospitalInfo: info)
                    }
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

struct HospitalInfoRow: View {
    let hospitalInfo: Hospital_data?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    
                    Image("hospital")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(.purple)
                        .padding(5)
                    
                    Text(hospitalInfo?.hospital?.name ?? "")
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundColor(.purple)
                }.layoutPriority(100)
                
                Text("Total admitted patients count - \(hospitalInfo?.treatment_local ?? 0)")
                    .font(.system(size: 23, weight: .regular, design: .monospaced))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            .padding()
            
            Spacer()
        }
        .background(Color(.white))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                .shadow(radius: 10)
        )
        .padding([.top, .horizontal])
    }
    
}

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $text)
                .padding(16)
                .padding(.horizontal, 25)
                .background(Color(.white))
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
 
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
