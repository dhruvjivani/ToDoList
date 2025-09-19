import SwiftUI

struct HomeView: View {
    @State private var trip: Trip? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
                LinearGradient(
                    colors: [Color("AccentColor"), Color("SecondaryAccent")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    // App Title
                    Text("My Travel Journal 🌍")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                        .padding(.top, 60)
                    
                    // Travel Icon with subtle scale animation
                    Image("travel_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .scaleEffect(1.05)
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: 1)
                    
                    // Buttons in a card-like container
                    VStack(spacing: 20) {
                        NavigationLink(destination: AddTripView(trip: $trip)) {
                            Text("Add New Trip")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                                .font(.headline)
                        }
                        
                        NavigationLink(destination: TripDetailView(trip: $trip)) {
                            Text("View Trip")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.15))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                                .font(.headline)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            }
        }
    }
}
    