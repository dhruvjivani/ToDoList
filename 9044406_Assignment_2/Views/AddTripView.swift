//
//  AddTripView.swift
//  9044406_Assignment_2
//
//  Created by Dhruv Rasikbhai Jivani on 9/18/25.
//

import SwiftUI

struct AddTripView: View {
    @Binding var trip: Trip?
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var location = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var notes = ""
    @State private var selectedImage: String = "None"
    
    let assetImages = ["None", "rome", "banff", "tokyo"]
    
    var isValid: Bool {
        title.trimmingCharacters(in: .whitespaces).count >= 2 &&
        location.trimmingCharacters(in: .whitespaces).count >= 2 &&
        startDate <= endDate &&
        notes.count <= 120
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Add Trip")
                    .titleStyle()
                    .padding(.bottom, 10)
                
                VStack(spacing: 15) {
                    TextField("Trip Title", text: $title)
                        .roundedBorderTextFieldStyle()
                    
                    TextField("Location", text: $location)
                        .roundedBorderTextFieldStyle()
                    
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                    
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                    
                    TextEditor(text: $notes)
                        .frame(height: 100)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    Picker("Image", selection: $selectedImage) {
                        ForEach(assetImages, id: \.self) { img in
                            Text(img.capitalized).tag(img)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical)
                    
                    if selectedImage != "None" {
                        Image(selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 90)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .cardStyle()
                
                HStack(spacing: 20) {
                    Button("Cancel") { dismiss() }
                        .buttonStyle(.bordered)
                    
                    Button("Save") {
                        trip = Trip(
                            title: title,
                            location: location,
                            startDate: startDate,
                            endDate: endDate,
                            notes: notes,
                            assetImageName: selectedImage == "None" ? nil : selectedImage
                        )
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("AccentColor"))
                    .disabled(!isValid)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .onAppear {
                if let t = trip {
                    title = t.title
                    location = t.location
                    startDate = t.startDate
                    endDate = t.endDate
                    notes = t.notes
                    selectedImage = t.assetImageName ?? "None"
                }
            }
            .navigationTitle(trip == nil ? "New Trip" : "Edit Trip")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
