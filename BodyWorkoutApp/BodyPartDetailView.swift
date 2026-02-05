//
//  BodyPartDetailView.swift
//  BodyWorkoutApp
//
//  Created by Haseeb Ahmed on 05/02/2026.
//

import SwiftUI

struct BodyPartDetailView: View {
    @Environment(\.dismiss) var dismiss
    let bodyPart: BodyPart
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Card
                    headerCard
                    
                    // Description Card
                    descriptionCard
                    
                    // Exercises Card
                    exercisesCard
                }
                .padding(20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
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
    
    private var headerCard: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [bodyPart.color, bodyPart.color.opacity(0.7)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .shadow(color: bodyPart.color.opacity(0.3), radius: 12, x: 0, y: 6)
                
                Image(systemName: bodyPart.icon)
                    .font(.system(size: 50, weight: .medium))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 8) {
                Text(bodyPart.name)
                    .font(.system(size: 28, weight: .bold))
                
                Text(bodyPart.category)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
    
    private var descriptionCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("About", systemImage: "info.circle.fill")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(bodyPart.color)
            
            Text(bodyPart.description)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.primary)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
    
    private var exercisesCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Exercises", systemImage: "figure.strengthtraining.traditional")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(bodyPart.color)
            
            VStack(spacing: 12) {
                ForEach(bodyPart.exercises, id: \.self) { exercise in
                    HStack(spacing: 12) {
                        Circle()
                            .fill(bodyPart.color)
                            .frame(width: 8, height: 8)
                        
                        Text(exercise)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}
