//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Ahmed Mgua on 9/30/20.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
		ZStack	{
			
			LinearGradient(gradient: Gradient(colors: [Color.blue, .white]), startPoint: .top, endPoint: .bottom)
				.blur(radius: 20)
				.edgesIgnoringSafeArea(.all)
			
			
			VStack {
				Text("Welcome to SnowSeeker!")
					.font(.largeTitle)
					.padding()
					.shadow(color: .white, radius: 3)
				
				Text("Swipe from the left edge to select a resort from the list.")
					.foregroundColor(.secondary)
				
			}.padding()
			
		}
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
