import Foundation

func printListVacancies (_ data: [Company]) -> [Company] {
    // новый массив данных
    let newData = data.map{ company in
        let filteredVacancies = company.vacancies.filter{ vacancy in
            return vacancy.profession == candidate.profession && vacancy.salary >= candidate.salary
        }

        // Создайте обновленную компанию с отфильтрованными вакансиями
        return Company(
            name: company.name,
            activity: company.activity,
            description: company.description,
            vacancies: filteredVacancies
        )
    }
    
    // прорисовка вакансий
    var i = 1
    print("The list of suitable vacancies: \n")
    for item in newData {
        for vac in item.vacancies {
            print("\(i).")
            print("\(vac.level) \(vac.profession)\t\t---\t\t>= \(vac.salary)")
            print("\t\(item.name)")
            print("\t\(item.activity)")
            print("\t\(vac.requiredSkills)")
            print("-----------------------------------------\n")
            i += 1
        }
    }
    
    return newData
}

// выбор вакансии
func selectVacancy (_ data: [Company], _ candi: Candidate) -> Bool {
    // считывание числа
    var number = readLine()
    while Int(number!) == nil {
        print("It doesn't look like a correct input.")
        number = readLine()
    }
    
    // счётчики
    var i = 1
    var j = 0
    var back = false
    var result = false
    
    // главный цикл
    for item in data {
        j = 0
        for _ in item.vacancies {
            if i == Int(number!) {
                result = item.interview(vacancyNumber: j, candidate: candi)
                back = true
                break
            }
            j += 1
            i += 1
        }
        if back == true {
            break
        }
    }
    
    return result
    
}

// структура компании
struct Company {
    let name: String
    let activity: String
    let description: String
    let vacancies: [Vacancy]
    
    func interview(vacancyNumber: Int, candidate: Candidate) -> Bool {
        
        let selectedVacancy = vacancies[vacancyNumber]
        let matchingSkills = Set(candidate.skills).intersection(selectedVacancy.requiredSkills)
        
        if matchingSkills.count * 2 >= selectedVacancy.requiredSkills.count {
            let result = Bool.random()
            if result {
                print("Success, candidate was applied.")
            } else {
                print("Unfortunately, the interview was not successful.")
            }
        } else {
            print("Candidate does not have enough skills for this position.")
        }
            
        return false
    }
}

// Структура вакансии
struct Vacancy {
    let profession: String
    let level: String
    let salary: Int
    let requiredSkills: Set<String>
}

// Структура кандидата
struct Candidate {
    let name: String
    let profession: String
    let level: String
    let salary: Int
    let skills: Set<String>
}

// Примеры компаний и вакансий
var arrCompany =  [ Company(
    name: "OOO \"SuperPay\"",
    activity: "Banking",
    description: "We provide innovative payment solutions.",
    vacancies: [
        Vacancy(profession: "Developer", level: "Junior", salary: 120000, requiredSkills: ["swift", "CoreData", "Realm"]),
        Vacancy(profession: "Analyst", level: "Junior", salary: 100000, requiredSkills: ["python", "matlab", "tensorflow", "excel"])
    ]
), Company(
    name: "MMM",
    activity: "Public services",
    description: "Public services for everyone.",
    vacancies: [
        Vacancy(profession: "Analyst", level: "Junior", salary: 100000, requiredSkills: ["excel", "access"]),
        Vacancy(profession: "Designer", level: "Middle", salary: 150000, requiredSkills: ["photoshop", "illustrator"])
    ]
), Company(
    name: "CryptoSuperGo",
    activity: "Banking",
    description: "Blockchain and cryptocurrency solutions.",
    vacancies: [
        Vacancy(profession: "Analyst", level: "Junior", salary: 120000, requiredSkills: ["python", "sql", "matlab", "pandas"]),
        Vacancy(profession: "Developer", level: "Senior", salary: 200000, requiredSkills: ["blockchain", "smart contracts"])
    ]
), Company(
    name: "Google",
    activity: "Coding",
    description: "Creating a new robot",
    vacancies: [
        Vacancy(profession: "Frontend", level: "Junior", salary: 200000, requiredSkills: ["java", "sql", "matlab", "js"]),
    ]
), Company(
    name: "Yandex",
    activity: "Scientist",
    description: "Machine learning",
    vacancies: [
        Vacancy(profession: "Analyst", level: "Junior", salary: 150000, requiredSkills: ["python", "sql", "matlab", "pandas"]),
    ]
)
]

// Пример кандидата
let candidate = Candidate(
    name: "Ivan",
    profession: "Analyst",
    level: "Junior",
    salary: 100000,
    skills: ["python", "matlab"]
)

var newArrCompany = printListVacancies(arrCompany)

let result = selectVacancy(newArrCompany, candidate)
