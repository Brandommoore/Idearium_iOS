//
//  ReplicateRepositoryProtocol.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 8/8/23.
//

import Foundation

protocol ReplicateRepositoryProtocol {
	func getPrediction(prompt: String, completion: @escaping (Prediction?, NetworkError?) -> ())
}
