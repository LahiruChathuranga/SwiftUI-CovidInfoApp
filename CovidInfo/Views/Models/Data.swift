
import Foundation
struct Data : Codable {
	let update_date_time : String?
	let local_new_cases : Int?
	let local_total_cases : Int?
	let local_total_number_of_individuals_in_hospitals : Int?
	let local_deaths : Int?
	let local_recovered : Int?
    let local_new_deaths: Int?
	let global_new_cases : Int?
	let global_total_cases : Int?
	let global_deaths : Int?
	let global_recovered : Int?
	let hospital_data : [Hospital_data]?

	enum CodingKeys: String, CodingKey {

		case update_date_time = "update_date_time"
		case local_new_cases = "local_new_cases"
		case local_total_cases = "local_total_cases"
		case local_total_number_of_individuals_in_hospitals = "local_total_number_of_individuals_in_hospitals"
		case local_deaths = "local_deaths"
        case local_new_deaths = "local_new_deaths"
		case local_recovered = "local_recovered"
		case global_new_cases = "global_new_cases"
		case global_total_cases = "global_total_cases"
		case global_deaths = "global_deaths"
		case global_recovered = "global_recovered"
		case hospital_data = "hospital_data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		update_date_time = try values.decodeIfPresent(String.self, forKey: .update_date_time)
		local_new_cases = try values.decodeIfPresent(Int.self, forKey: .local_new_cases)
		local_total_cases = try values.decodeIfPresent(Int.self, forKey: .local_total_cases)
		local_total_number_of_individuals_in_hospitals = try values.decodeIfPresent(Int.self, forKey: .local_total_number_of_individuals_in_hospitals)
		local_deaths = try values.decodeIfPresent(Int.self, forKey: .local_deaths)
        local_new_deaths = try values.decodeIfPresent(Int.self, forKey: .local_new_deaths)
		local_recovered = try values.decodeIfPresent(Int.self, forKey: .local_recovered)
		global_new_cases = try values.decodeIfPresent(Int.self, forKey: .global_new_cases)
		global_total_cases = try values.decodeIfPresent(Int.self, forKey: .global_total_cases)
		global_deaths = try values.decodeIfPresent(Int.self, forKey: .global_deaths)
		global_recovered = try values.decodeIfPresent(Int.self, forKey: .global_recovered)
		hospital_data = try values.decodeIfPresent([Hospital_data].self, forKey: .hospital_data)
	}

}
