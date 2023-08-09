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
	private let server: String = "https://api.replicate.com/v1/predictions"
	private let modelVersion = "ac732df83cea7fff18b8472768c88ad041fa750ff7682a21affe81863cbe77e4"
	private let token: String = Tokens().replicate
	private var prompt: String = ""
	//private var prediction: Prediction
	
	func getPrediction(prompt: String) async throws -> Prediction? {
		self.prompt = prompt
		guard let url = getSessionPrediction(prompt: prompt) else {
			throw NetworkError.malformedUrl
		}
		let (data, _) = try await URLSession.shared.data(for: url)
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		guard let predictionResponse = try? decoder.decode(Prediction.self, from: data) else {
			print("Error decoding response")
			return nil
		}
		let prediction = self.transformResponseToPrediction(predictionResponse: predictionResponse, prompt: prompt)
		//print(prediction)
		return prediction
	}
	
	func refetchPrediction(prediction: Prediction) async throws -> Prediction? {
		guard let urlRequest = getSessionRefetchPrediction(id: prediction.id!) else {
			throw NetworkError.malformedUrl
		}
		let (data, _) = try await URLSession.shared.data(for: urlRequest)
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		guard let predictionResponse = try? decoder.decode(Prediction.self, from: data) else {
			print("Error decoding response")
			return nil
		}
		let finalPrediction = self.getFinalPrediction(predictionResponse: predictionResponse, prediction: prediction)
		//print("Final prediction is \(finalPrediction)")
		return finalPrediction
	}
		
	func getFinalPrediction(prompt: String) async throws -> Prediction? {
		let prediction: Prediction? = try? await getPrediction(prompt: prompt)
		var refecthPrediction: Prediction?
		var queue: Int = 0
		if prediction == nil {
			return nil
		}
		if prediction?.status! == "starting" {
			//try await Task.sleep(nanoseconds: 5_000_000_000)
			refecthPrediction = try? await refetchPrediction(prediction: prediction!)
			while (refecthPrediction?.status! != "succeeded" || queue < 2) {
				try await Task.sleep(nanoseconds: 5_000_000_000)
				refecthPrediction = try? await refetchPrediction(prediction: prediction!)
				queue = queue + 1
			}
		}
		print("\t\tFinal with output: \(String(describing: refecthPrediction))")
		return refecthPrediction
	}
}

extension ReplicateRemDatSourImp {

	func getSessionPrediction(prompt: String) -> URLRequest? {
		guard let url = URL(string: server) else {
			print("error: invalid url")
			return nil
		}
		var request = URLRequest(url: url)
		let params = "{\"version\": \"\(modelVersion)\",\"input\": {\"prompt\": \"\(prompt)\"}}"
		let body = params.data(using: .utf8)
		
		request.httpMethod = "POST"
		request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
		request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
		request.httpBody = body
		return request
	}
	
	func getSessionRefetchPrediction(id: String) -> URLRequest? {
		print("\(server)/\(id)")
		guard let url = URL(string: "\(server)/\(id)") else {
			print("error: invalid url")
			return nil
		}
		var request = URLRequest(url: url)
		let params = "{\"version\": \"\(modelVersion)\",\"input\": {\"prompt\": \"\(prompt)\"}}"
		let body = params.data(using: .utf8)
		
		request.httpMethod = "POST"
		request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
		request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
		request.httpBody = body
		return request
	}
	
	// Force unwrap the values and complete the Prediction. Then the final prediction is returned
	func transformResponseToPrediction(predictionResponse: Prediction, prompt: String) -> Prediction {
		let prediction: Prediction = .init(id: predictionResponse.id!,
										   inputPrompt: prompt,
										   output: predictionResponse.output,
										   status: predictionResponse.status!)
		
		return prediction
	}
	
	// Merge both prediction responses into one prediction, and returns it
	func getFinalPrediction(predictionResponse: Prediction, prediction: Prediction) -> Prediction {
		let finalPrediction: Prediction = .init(id: prediction.id!,
												inputPrompt: prediction.inputPrompt!,
												output: predictionResponse.output,
												status: predictionResponse.status)
		return finalPrediction
	}
	
}

