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
		guard let urlRequest = getSessionPrediction(prompt: prompt) else {
			completion(nil, .malformedUrl)
			return
		}
		let task = session.dataTask(with: urlRequest) { data, response, error in
			guard error == nil else {
				completion(nil, .other)
				return
			}
			guard let data = data else {
				completion(nil, .noData)
				return
			}
			guard let httpResponse = ((response) as? HTTPURLResponse), httpResponse.statusCode == 201 else {
				let statusCode = (response as? HTTPURLResponse)?.statusCode
				completion(nil, .errorCode(statusCode))
				return
			}
			let jsonDecoder = JSONDecoder()
			jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
			guard let predictionResponse = try? jsonDecoder.decode(Prediction.self, from: data) else {
				completion(nil, .decoding)
				return
			}
			print(String(data: data, encoding: .utf8)!)
			//print(predictionResponse.status)
			completion(predictionResponse, nil)
		}
		task.resume()
	}
	
	func refetchPrediction(id: String, completion: @escaping (Prediction?, NetworkError?) -> ()) {
		guard let urlRequest = getSessionRefetchPrediction(id: id) else {
			completion(nil, .malformedUrl)
			return
		}
		let task = session.dataTask(with: urlRequest) { data, response, error in
			guard error == nil else {
				completion(nil, .other)
				return
			}
			guard let data = data else {
				completion(nil, .noData)
				return
			}
			guard let httpResponse = ((response) as? HTTPURLResponse), httpResponse.statusCode == 201 else {
				let statusCode = (response as? HTTPURLResponse)?.statusCode
				completion(nil, .errorCode(statusCode))
				return
			}
			let jsonDecoder = JSONDecoder()
			jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
			guard let predictionResponse = try? jsonDecoder.decode(Prediction.self, from: data) else {
				completion(nil, .decoding)
				return
			}
			print(String(data: data, encoding: .utf8)!)
			//print(predictionResponse.status)
			completion(predictionResponse, nil)
		}
		task.resume()
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
		guard let url = URL(string: "\(server)/\(id) ") else {
			print("error: invalid url")
			return nil
		}
		var request = URLRequest(url: url)
		
		request.httpMethod = "POST"
		request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
		request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
		return request
	}
	
	//func guardsSessionsTasks()

}
