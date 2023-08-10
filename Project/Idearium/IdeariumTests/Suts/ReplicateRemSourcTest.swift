//
//  ReplicateRemSourcTest.swift
//  IdeariumTests
//
//  Created by Córdoba Velicias Manuel on 10/8/23.
//

import XCTest
@testable import Idearium

final class ReplicateRemSourcTest: XCTestCase {

	// MARK: - SUT
	var sut: ReplicateRemDatSourImp?
	
	// MARK: - Properties
	//let prediction: Prediction
	let id: String = "6gfga8dgg3"
	let inputPrompt: String = "my beautifull prompt"
	let output: [String]? = []
	let status: String = "success"
	
    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = ReplicateRemDatSourImp()
	}

    override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}

	func testTransformResponseToPrediction_whenInsertPredictionAndPrompt_returnPrediction() throws {
		// GIVEN
		let initialPrediction = Prediction(id: id, inputPrompt: "", output: [], status: status)
		let expectedPrediction = Prediction(id: id, inputPrompt: inputPrompt, output: [], status: status)
		
		// WHEN
		let finalPrediction = sut?.transformResponseToPrediction(predictionResponse: initialPrediction, prompt: inputPrompt)
		
		// THEN
		XCTAssertEqual(finalPrediction, expectedPrediction, "error: prediction must be equal")
	}
	
	func testGetFinalPrediction_whenInsertPredictions_returnTransformedPrediction() throws {
		// GIVEN
		let initialPrediction = Prediction(id: id, inputPrompt: inputPrompt, output: [], status: status)
		let initialPredictionResponse = Prediction(id: id, inputPrompt: inputPrompt, output: ["urlImage"], status: "succeed")
		let expectedPrediction = Prediction(id: id, inputPrompt: inputPrompt, output: ["urlImage"], status: "succeed")
		
		// WHEN
		let finalPrediction = sut?.getFinalPrediction(predictionResponse: initialPredictionResponse, prediction: initialPrediction)
		
		// THEN
		XCTAssertEqual(finalPrediction, expectedPrediction, "error: prediction must be equal")
	}

}
