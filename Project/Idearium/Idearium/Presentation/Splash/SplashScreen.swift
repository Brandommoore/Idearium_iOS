//
//  SplashScreen.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct SplashScreen: View {
	
	// MARK: - States
	@State var isActive: Bool = false
	
    var body: some View {
		if self.isActive {
			HomeView()
		} else {
			ZStack(alignment: .center) {
				Rectangle().fill(Color("AppBackgroundColor"))
				Image("i_splash")
					.resizable()
					.frame(width: 225, height: 395)
					.ignoresSafeArea(.all)
			}
			.background(Color("AppBackgroundColor"))
			.preferredColorScheme(.dark)
			// On appear after 2.5s delay, change "isActive" state to true
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
					withAnimation { self.isActive = true }
				}
			}
		}
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
