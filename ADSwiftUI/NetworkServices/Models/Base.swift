
import Foundation
struct Base : Codable {
	let sites : [Sites]?

	enum CodingKeys: String, CodingKey {

		case sites = "sites"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sites = try values.decodeIfPresent([Sites].self, forKey: .sites)
	}

}
