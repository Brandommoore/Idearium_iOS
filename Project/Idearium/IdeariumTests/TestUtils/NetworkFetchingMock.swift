//
//  NetworkFetchingMock.swift
//  IdeariumTests
//
//  Created by Córdoba Velicias Manuel on 10/8/23.
//

import Foundation
@testable import Idearium

class NetworkFetchingMock: NetworkfetchingProtocol {
	let result: Result<Data, Error>
	
	init(returning result: Result<Data, Error>) {
		self.result = result
	}
	
	func load(_ request: URLRequest) -> AnyPublisher<Data, Error> {
		return result.publisher
			.eraseToAnyPublisher()
	}
}
