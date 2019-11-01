
import Foundation
struct Sites : Codable, Identifiable {
	let id : String?
	let name : String?
	let image : String?
	let address : String?
    var contacts : [Contacts]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case image = "image"
		case address = "address"
		case contacts = "contacts"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		contacts = try values.decodeIfPresent([Contacts].self, forKey: .contacts)
	}

}
