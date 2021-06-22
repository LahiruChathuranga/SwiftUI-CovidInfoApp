//
//  LiveInfoViewModel.swift
//  CovidInfo
//
//  Created by Lahiru Chathuranga on 6/13/21.
//

import Foundation
import SwiftUI

class LiveInfoViewModel: ObservableObject {
    
    @Published var activeCases: String = ""
    @Published var dailyNewCases: String = ""
    @Published var totalConfirmedCases: String = ""
    @Published var deaths: String = ""
    @Published var newDeaths: String = ""
    @Published var recovered: String = ""
    @Published var hospitalCases: String = ""
    @Published var date: String = ""
    @Published var isLoading: Bool = false
    @Published var hospitalInfo: [Hospital_data]?
    
    init() {
        isLoading.toggle()
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.hpb.health.gov.lk/api/get-current-statistical") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert data to Model
            
            do {
                let model = try JSONDecoder().decode(LiveInfoDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.activeCases = String(model.data?.local_total_number_of_individuals_in_hospitals ?? 0)
                    self.dailyNewCases = String(model.data?.local_new_cases ?? 0)
                    self.totalConfirmedCases = String(model.data?.local_total_cases ?? 0)
                    self.deaths = String(model.data?.local_deaths ?? 0)
                    self.newDeaths = String(model.data?.local_new_deaths ?? 0)
                    self.recovered = String(model.data?.local_recovered ?? 0)
                    self.hospitalCases = String(model.data?.local_total_number_of_individuals_in_hospitals ?? 0)
                    self.date = String(model.data?.update_date_time?.split(separator: " ")[0] ?? "")
                    
                    self.hospitalInfo = model.data?.hospital_data
                    self.isLoading.toggle()
                }
            } catch {
                print("Failed.")
            }
            
            
        }
        
        task.resume()
    }
    
}
