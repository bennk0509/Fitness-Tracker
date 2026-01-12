import SwiftUI

struct ShowExerciseTemplate: View {

    let exercises: [ExerciseTemplate]
    let onSelect: (ExerciseTemplate) -> Void

    @State private var searchText: String = ""
    
    private var filtered: [ExerciseTemplate] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if q.isEmpty { return exercises }
        return exercises.filter { $0.name.lowercased().contains(q) }
    }

    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Text("Library")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            HStack(spacing: 20) {
                Text("Exercises")
                    .font(.callout)
                    .bold()
                Text("Favorite exercises")
                    .font(.callout)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }

            // Search
            HStack {
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

            // List
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filtered) { ex in
                        Button {
                            onSelect(ex)
                        } label: {
                            HStack {
                                Text(ex.name)
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                            }
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .foregroundStyle(.black)
        .padding()
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShowExerciseTemplate(
            exercises: sampleExerciseTemplates,
            onSelect: { _ in }
        )
        .padding()
        .foregroundColor(.white)
    }
}
