//
//  Idea.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

struct Idea: Hashable, Encodable, Decodable {
	var id: String?
	var systemId: String?
	var prompt: String?
	var image: String?
	var status: String?
	var isFav: Bool?
}
