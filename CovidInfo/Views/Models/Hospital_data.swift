
import Foundation
import SwiftUI

struct Hospital_data : Codable, Identifiable {
	let id : Int?
	let hospital_id : Int?
	let cumulative_local : Int?
	let cumulative_foreign : Int?
	let treatment_local : Int?
	let treatment_foreign : Int?
	let created_at : String?
	let updated_at : String?
	let deleted_at : String?
	let cumulative_total : Int?
	let treatment_total : Int?
	let hospital : Hospital?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case hospital_id = "hospital_id"
		case cumulative_local = "cumulative_local"
		case cumulative_foreign = "cumulative_foreign"
		case treatment_local = "treatment_local"
		case treatment_foreign = "treatment_foreign"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
		case cumulative_total = "cumulative_total"
		case treatment_total = "treatment_total"
		case hospital = "hospital"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		hospital_id = try values.decodeIfPresent(Int.self, forKey: .hospital_id)
		cumulative_local = try values.decodeIfPresent(Int.self, forKey: .cumulative_local)
		cumulative_foreign = try values.decodeIfPresent(Int.self, forKey: .cumulative_foreign)
		treatment_local = try values.decodeIfPresent(Int.self, forKey: .treatment_local)
		treatment_foreign = try values.decodeIfPresent(Int.self, forKey: .treatment_foreign)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
		cumulative_total = try values.decodeIfPresent(Int.self, forKey: .cumulative_total)
		treatment_total = try values.decodeIfPresent(Int.self, forKey: .treatment_total)
		hospital = try values.decodeIfPresent(Hospital.self, forKey: .hospital)
	}

}
