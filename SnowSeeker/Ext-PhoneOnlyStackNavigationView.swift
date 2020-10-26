//
//  ExtensionPreventSlideOver.swift
//  SnowSeeker
//
//  Created by Ahmed Mgua on 9/30/20.
//

import SwiftUI

extension	View	{
	func phoneOnlyStackNavigationView() -> some View {
		if UIDevice.current.userInterfaceIdiom	==	.phone {
			return	AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
		}	else	{
			return	AnyView(self)
		}
	}
}
