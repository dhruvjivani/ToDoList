//
//  TripDetailView.swift
//  9044406_Assignment_2
//
//  Created by Dhruv Rasikbhai Jivani on 9/18/25.
//

import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip?
    
    var body: some View {
        VStack(spacing: 16) {
            if let trip = trip {
                if let imageName = trip.assetImageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(trip.title)
                        .font(.title.bold())
                    
                    Text(trip.location)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(trip.startDate.formatted(date: .abbreviated, time: .omitted)) - \(trip.endDate.formatted(date: .abbreviated, time: .omitted)) • \(trip.durationInDays) days")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(trip.notes)
                        .font(.body)
                        .lineLimit(2)
                }
                .cardStyle()
                
                Spacer()
            } else {
                VStack(spacing: 12) {
                    Text("No trip recorded yet")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    NavigationLink("Add New Trip") {
                        AddTripView(trip: $trip)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
        .navigationTitle("Trip Details")
    }
}
