// Структура для блока информации о кандидате
struct CandidateInfo {
    var fullName: String
    var profession: String
    var gender: String
    var dateOfBirth: String
    var contacts: String
}

// Структура для блока информации об образовании
struct EducationInfo {
    var type: String
    var years: String
    var description: String
}

// Структура для блока опыта работы
struct WorkExperience {
    var period: String
    var companyName: String
    var description: String
}

// Свободный блок
struct FreeBlock {
    var description: String
}
