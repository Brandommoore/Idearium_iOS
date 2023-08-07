//
//  ReplicateDataSourceProtocol.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

protocol ReplicateDataSourceProtocol {
	func getPrediction(prompt: String, completion: @escaping (Prediction?, NetworkError?) -> ())
	func refetchPrediction(id: String, completion: @escaping (Prediction?, NetworkError?) -> ())
}
