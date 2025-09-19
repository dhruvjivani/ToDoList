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
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                if let t = trip {
                    if let imageName = t.assetImageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(t.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text(t.location)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        let duration = Calendar.current.dateComponents([.day], from: t.startDate, to: t.endDate).day ?? 0
                        
                        HStack(spacing: 5) {
                            Image(systemName: "calendar.circle.fill")
                                .foregroundColor(Color("SecondaryAccent"))
                            Text("\(t.startDate.formatted(date: .abbreviated, time: .omitted)) - \(t.endDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Text("\(duration + 1) days")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text("Notes")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        Text(t.notes)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineLimit(nil)
                    }
                    .padding()
                    .cardStyle()
                    .padding(.horizontal)
                    
                    NavigationLink("Edit Trip") {
                        AddTripView(trip: $trip)
                    }
                    .buttonStyle(.tripDetail)
                    .padding(.horizontal, 20)
                    
                } else {
                    VStack(spacing: 15) {
                        Text("No Trip Saved Yet")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        NavigationLink("Add New Trip") {
                            AddTripView(trip: $trip)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
        .navigationTitle("Trip Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
