
import Foundation
struct Contacts : Codable, Identifiable, Hashable {
    var id: UUID
    
	let name : String?
	let phone : String?
    let phone_home : String?
	let email : String?

	enum CodingKeys: String, CodingKey {
//        case id = "id"
		case name = "name"
		case phone = "phone"
        case phone_home = "phone_home"
		case email = "email"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
		name = try values.decodeIfPresent(String.self, forKey: .name)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
        phone_home = try values.decodeIfPresent(String.self, forKey: .phone_home)
		email = try values.decodeIfPresent(String.self, forKey: .email)
	}

}
