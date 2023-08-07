//
//  ReplicateRemDatSourImp.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

enum NetworkError: Error, Equatable {
	case malformedUrl
	case other
	case noData
	case errorCode(Int?)
	case decoding
}

class ReplicateRemDatSourImp: ReplicateDataSourceProtocol {
	
	// MARK: - Properties
	private var session: URLSession
	private let server: String = "https://api.replicate.com/v1/predictions"
	private let modelVersion = "ac732df83cea7fff18b8472768c88ad041fa750ff7682a21affe81863cbe77e4"
	private let token: String = Tokens().replicate
	
	init(session: URLSession = URLSession.shared) {
		self.session = session
	}
	
	func getPrediction(prompt: String, completion: @escaping (Prediction?, NetworkError?) -> ()) {
		<#code#>
	}
	
	func refetchPrediction(id: String) {
		<#code#>
	}
	
	
}
