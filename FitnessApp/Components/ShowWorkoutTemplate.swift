//
//  ShowWorkoutTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

struct ShowWorkoutTemplate: View {
    @State private var searchText: String = ""
    let templates: [WorkoutTemplate]
    var body: some View {
        
        VStack(spacing:20){
            HStack{
                Text("Library")
                    .font(Font.largeTitle)
                    .bold()
                Spacer()
            }
            
            HStack(spacing:20){
                Text("Workouts")
                    .font(Font.callout)
                    .bold()
                Text("Your workout")
                    .font(Font.callout)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack{
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    TextField("Search exercise", text: $searchText)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color("DarkGray"))
                .cornerRadius(20)
            }
            ScrollView {
                LazyVStack{
                    ForEach(templates){ template in
                        HStack{
                            VStack(alignment: .leading, spacing: 4) {
                                Text(template.name)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("\(template.defaultExercises.count) exercises")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(Color("DarkGray"))
//                        )
                    }
                    
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    ShowWorkoutTemplate(templates: sampleWorkoutTemplates)
}
