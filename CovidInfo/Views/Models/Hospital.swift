
import Foundation
struct Hospital : Codable {
	let id : Int?
	let name : String?
	let created_at : String?
	let updated_at : String?
	let deleted_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
	}

}
