import SwiftUI

class AddWorkoutSessionViewModel: ObservableObject {
    @Published var session = WorkoutSession()
    @Published var elapsedTime: TimeInterval = 0
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func addExercise(name: String) {
        let newEx = WorkoutExercise(name: name)
        session.exercises.append(newEx)
    }
    
    func addSet(to exercise: WorkoutExercise) {
        guard let index = session.exercises.firstIndex(where: { $0.id == exercise.id }) else { return }
        
        session.exercises[index].sets.append(
            WorkoutSet(reps: 0, weight: 0)
        )
    }
    
    func finishSession() {
        stopTimer()
        // Sau này save vào CoreData
        print("Workout finished: \(session)")
    }
}
