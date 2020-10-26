//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Ahmed Mgua on 9/30/20.
//

import SwiftUI

struct ResortView: View {
	let resort:	Resort
	@Environment(\.horizontalSizeClass)	var sizeClass
	@State private var selectedFacility:	Facility?
	
    var body: some View {
		ScrollView	{
			VStack(alignment: .leading, spacing: 0) {
				Image(decorative: resort.id)
					.resizable()
					.scaledToFit()
				HStack	{
					if sizeClass	==	.compact	{
						Spacer()
						VStack	{	ResortDetailsView(resort: resort)	}
						Spacer()
						VStack	{	SkiDetailsView(resort: resort)	}
						Spacer()
					}	else	{
						Spacer()
						ResortDetailsView(resort: resort)
						Spacer().frame(height:	0)
						SkiDetailsView(resort: resort)
						Spacer()
					}
					
				}.font(.headline)
				.foregroundColor(.secondary)
				.padding(.top)
				Group	{
					Text(resort.description)
						.padding(.vertical)
					
					Text("Facilities")
						.font(.headline)
					
					HStack(spacing:	40)	{
						ForEach(resort.facilityTypes)	{	facility	in
							facility.icon
								.font(.title)
								.onTapGesture(count: 1, perform: {
									self.selectedFacility	=	facility
								})
						}
					}
					.padding(.vertical)
				}
				.padding(.horizontal)
			}
			
			
		}.navigationTitle(Text("\(resort.name), \(resort.country)"))
		.alert(item: $selectedFacility) {	facility in
			facility.alert
		}
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
		ResortView(resort: Resort.example)
    }
}
