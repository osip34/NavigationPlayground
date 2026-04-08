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
    
    var presentingSheet: Destination? {
        didSet { if presentingSheet == nil { sheetState = nil } }
    }
    
    var presentingFullScreenCover: Destination? {
        didSet { if presentingFullScreenCover == nil { fullScreenCoverState = nil } }
    }
    
    // Nested modal states
    var sheetState: NavigationState?
    var fullScreenCoverState: NavigationState?
}
