//
//  SampleData.swift
//  IOS-Training
//
//  Created by Sherwin Lauronilla Villaver on 13/04/2018.
//  Copyright © 2018 Sherwin. All rights reserved.
//

import Foundation

final class SampleData {
    static func generatePlayersData() -> [Player] {
        return [
            Player(name: "Sherwin", game: "PUBG", rating: 5),
            Player(name: "Chin2", game: "PUBG", rating: 5),
            Player(name: "Jo", game: "PUBG", rating: 5),
            Player(name: "Lem", game: "ROS", rating: 1)
        ]
    }
}
