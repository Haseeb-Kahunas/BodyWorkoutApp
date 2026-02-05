//
//  BodyPartsListView.swift
//  BodyWorkoutApp
//
//  Created by Haseeb Ahmed on 05/02/2026.
//

import SwiftUI

struct BodyPartsListView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedBodyPart: BodyPart?
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredBodyParts: [BodyPart] {
        if searchText.isEmpty {
            return BodyPart.allCases
        }
        return BodyPart.allCases.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(filteredBodyParts.enumerated()), id: \.element) { index, bodyPart in
                        BodyPartCard(bodyPart: bodyPart)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    selectedBodyPart = bodyPart
                                    dismiss()
                                }
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                            .transition(.scale.combined(with: .opacity))
                            .animation(
                                .spring(response: 0.4, dampingFraction: 0.8)
                                    .delay(Double(index) * 0.05),
                                value: filteredBodyParts.count
                            )
                    }
                }
                .padding(20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Body Parts")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search body parts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct BodyPartCard: View {
    let bodyPart: BodyPart
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [bodyPart.color, bodyPart.color.opacity(0.7)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: bodyPart.icon)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 4) {
                Text(bodyPart.name)
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text(bodyPart.category)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
