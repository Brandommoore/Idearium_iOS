//
//  Prediction.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

struct Prediction: Codable, Equatable {
	let id: String?
	let inputPrompt: String?
	let output: [String]?
	let status: String?
}
