//
//  Trip.swift
//  9044406_Assignment_2
//
//  Created by Dhruv Rasikbhai Jivani on 9/18/25.
//

import SwiftUI

struct Trip: Identifiable {
    let id = UUID()
    var title: String
    var location: String
    var startDate: Date
    var endDate: Date
    var notes: String
    var assetImageName: String? // e.g., "rome", "banff", "tokyo"
}
