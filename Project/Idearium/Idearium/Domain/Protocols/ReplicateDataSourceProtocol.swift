//
//  ReplicateDataSourceProtocol.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

protocol ReplicateDataSourceProtocol {
	func getPrediction(prompt: String) async throws -> Prediction?
	func refetchPrediction(prediction: Prediction) async throws -> Prediction?
}
