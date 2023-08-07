//
//  PromptParser.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

	struct PromptParser {
		
		private var character: String
		private var action: String
		private var place: String
		private var imageStyle: String
		
		init(character: String, action: String,
			 place: String, imageStyle: String) {
			self.character = character
			self.action = action
			self.place = place
			self.imageStyle = imageStyle
		}
		
		mutating func parsePrompt() -> String {
			// Prompt type: Generate a $character $action in $place, whith a $imageStyle style
			var prompt: String
			
			if character.count > 0 {
				self.character = "Generate a \(character) "
			}
			if imageStyle.count > 0 {
				self.imageStyle = ", with a \(imageStyle) style"
			}
			prompt = "\(character)\(action) \(place)\(imageStyle)"
			return prompt.lowercased()
		}
}
