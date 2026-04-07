//
//  NavigationState.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 06.04.2026.
//

import Foundation

@Observable
class NavigationState {
    var navigationStackPath: [Destination] = []
    var presentingSheet: Destination?
    var presentingFullScreenCover: Destination?
    
    // Nested modal states
    var sheetState: NavigationState?
    var fullScreenCoverState: NavigationState?
}
