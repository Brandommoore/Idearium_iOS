//
//  NewArtworkView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 4/8/23.
//

import SwiftUI

struct NewArtworkView: View {
	
	// MARK: - Properties
	@EnvironmentObject var rootViewModel: RootViewModel
	
	// MARK: - States
	@State private var character = ""
	@State private var action = ""
	@State private var place = ""
	@State private var imageStyle = ""
	@EnvironmentObject var newArtworkViewModel: NewArtworkViewModel
	
	// MARK: - Vars
	let filedTit: [String] = [
		"Choose a character",
		"What is the character doing",
		"Where is he/she doing it",
		"Whith what style"
	]
	
	let placeholders: [String] = [
		"Astronaut",
		"Riding a horse",
		"In mars",
		"Realistic"
	]
	
    var body: some View {
		ZStack(alignment: .center) {
			VStack(alignment: .center) {
				returnButtonBar()
				Text("Let´s create an new ArtWork!!")
					.font(.largeTitle)
					.fontWeight(.bold)
					.fontWidth(.expanded)
					.multilineTextAlignment(.center)
					.padding(.top, 50)
					.padding(.bottom, 90)
				VStack(alignment: .center, spacing: 70) {
					generateTextField(title: filedTit[0], placeholder: placeholders[0], stateVar: $character)
					generateTextField(title: filedTit[1], placeholder: placeholders[1], stateVar: $action)
					generateTextField(title: filedTit[2], placeholder: placeholders[2], stateVar: $place)
					generateTextField(title: filedTit[3], placeholder: placeholders[3], stateVar: $imageStyle)
				}
				Spacer().frame(height: 110)
				generateArtworkButton()
			}
		}
		.ignoresSafeArea(.all)
		.preferredColorScheme(.dark)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("AppBackgroundColor"))
    }
}

extension NewArtworkView {
	
	// Generate the artwork button to start the generation
	func generateArtworkButton() -> some View {
		Button {
			print("Generate Button Pressed")
			print("Form Data:\n\tcharacter: \(character)")
			print("\taction: \(action)\n\tplace: \(place)")
			print("\timageStyle: \(imageStyle)")
		} label: {
			ZStack(alignment: .center) {
				Rectangle()
					.foregroundColor(.clear)
					.frame(width: 350, height: 56)
					.background(Color(.black))
					.cornerRadius(15)
					.overlay(
						RoundedRectangle(cornerRadius: 15)
							.inset(by: 0.5)
							.stroke(.white, lineWidth: 1)
					)
				Text("Generate Artwork")
					.fontWeight(.heavy)
					.fontWidth(.init(CGFloat(30)))
					.foregroundColor(.white)
			}
			.frame(width: 350, height: 56)
		}
	}
	
	// Generate the input text field
	func generateTextField(title: String, placeholder: String, stateVar: Binding<String>) -> some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.title2)
				.fontWeight(.bold)
			ZStack(alignment: .center) {
				Rectangle()
					.foregroundColor(.clear)
					.frame(width: 362, height: 50)
					.background(Color(red: 0.04, green: 0.04, blue: 0.04))
					.overlay(
						Rectangle()
							.inset(by: 0.5)
							.stroke(.white, lineWidth: 1)
					)
				TextField(placeholder, text: stateVar)
					.padding([.leading, .trailing], 15)
			}.frame(maxWidth: .infinity, maxHeight: .infinity)
		}.frame(width: 362, height: 50)
	}
	
	// On generate artwork button clicked
	func onClickGenerateButton(charact: String, action: String, place: String, imgStyle: String) {
		var prompt: String = ""
		prompt = transformStatesToPrompt(character: charact, action: action, place: place, imageStyle: imgStyle)
		// Write the function on viewmodel
	}
	
	// Transform the state vars to prompt
	func transformStatesToPrompt(character: String, action: String, place: String, imageStyle: String) -> String {
		var promptParser = PromptParser(character: character, action: action, place: place, imageStyle: imageStyle)
		let prompt = promptParser.parsePrompt()
		return prompt
	}
	
	// Return button of topNavigationBar
	func returnButtonBar() -> some View {
		HStack {
			Button{
				print("Return button pulsed")
				rootViewModel.status = .home
			} label: {
				Image(systemName: "arrowtriangle.left.fill")
					.resizable()
					.frame(width: 25, height: 25)
					.foregroundColor(.white)
					.padding(.top, 70) 	// This is the top margin of all button bar
					.padding(.leading, 30)
			}
			Spacer()
		}
		.padding(.bottom, -25)
	}
	
}



struct NewArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        NewArtworkView()
    }
}
