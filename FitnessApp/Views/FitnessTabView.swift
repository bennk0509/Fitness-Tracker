//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI


struct FitnessTabView: View {

    @State private var goToAddSession = false

    var body: some View {

        NavigationStack {

            ZStack(alignment: .bottomTrailing) {

                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }

                    Text("Account")
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                }

                Button {
                    goToAddSession = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.trailing, 24)
                .padding(.bottom, 40)
            }

            .navigationDestination(isPresented: $goToAddSession) {
            }
        }
    }
}



#Preview {
    FitnessTabView()
}
