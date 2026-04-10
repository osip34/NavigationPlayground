//
//  Destination.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 09.04.2026.
//

enum Destination: String, Identifiable {
    case home
    case details
    case firstCover
    case secondCover
    case thirdDestination

    var id: String {
        return self.rawValue
    }
}
