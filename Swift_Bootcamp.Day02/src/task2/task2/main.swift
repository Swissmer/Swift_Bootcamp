import Foundation

// Структуры
var candidateInfo: CandidateInfo?
var educationInfo: EducationInfo?
var workExperience: [WorkExperience?]?
var freeBlock: FreeBlock?

if readFile(candidateInfo: &candidateInfo, educationInfo: &educationInfo, workExperience: &workExperience, freeBlock: &freeBlock) {
    print("Error read File")
} else {
    analysis(educationInfo: educationInfo, workExperience: workExperience!, freeBlock: freeBlock)
}
