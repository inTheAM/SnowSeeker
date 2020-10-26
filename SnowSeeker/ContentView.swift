//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Ahmed Mgua on 9/29/20.
//

import SwiftUI

struct ContentView: View {
	let resorts	=	Resort.allResorts
	@ObservedObject	var favorites	=	Favorites()
	
	
    var body: some View {
		NavigationView	{
			List(resorts)	{	resort in
				NavigationLink(destination:	ResortView(resort: resort))	{
					HStack	{
						Image(resort.country)
							.resizable()
							.scaledToFill()
							.frame(width:	40,	height:	25)
							.clipShape(
								RoundedRectangle(cornerRadius: 5)
								
							)
							.shadow(color:	.white,	radius: 1)
						
						VStack(alignment:	.leading)	{
							Text(resort.name)
								.font(.headline)
							Text("\(resort.runs) runs")
								.foregroundColor(.secondary)
						}
						if self.favorites.contains(resort)	{
							Spacer()
							Image(systemName: "heart.fill")
								.foregroundColor(.red)
								.frame(width:	30,	height:	30)
								.accessibility(label: Text("This is one of your favorites."))
						}
					}.contextMenu {
						Button(action:	{
							if self.favorites.contains(resort)	{
								self.favorites.remove(resort)
							}	else	{
								self.favorites.add(resort)
							}
						}, label:	{
							self.favorites.contains(resort)	?	Text("Remove from favorites")	:	Text("Add to favorites")
						})
					}
				}
			}.navigationTitle("Resorts")
			
			WelcomeView()
		}.phoneOnlyStackNavigationView()
		.environmentObject(favorites)
			
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
