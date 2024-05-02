import Foundation

// чтение информации
func readInfo(_ data: [String], i: inout Int, textArr: inout [String]) -> CandidateInfo? {
    var candidate: CandidateInfo? = nil
    if textArr[i+1] != "" && textArr[i+2] != "" && textArr[i+3] != "" && textArr[i+4] != "" {
        candidate = CandidateInfo(
            fullName: textArr[i+1],
            profession: textArr[i+2],
            gender: textArr[i+3],
            dateOfBirth: textArr[i+4],
            contacts: ""
        )
        i += 4
        while textArr[i] != "" {
            candidate?.contacts += textArr[i]
            i += 1
        }
    }
    return candidate
}

// чтение образования
func readEducInfo(_ data: [String], i: inout Int, textArr: inout [String]) -> EducationInfo? {
    var candidate: EducationInfo? = nil
    if textArr[i+1] != "" && textArr[i+2] != "" {
        candidate = EducationInfo(
            type: textArr[i+1],
            years: textArr[i+2],
            description: ""
        )
        i += 3
        while textArr[i] != "" {
            candidate?.description += textArr[i]
            i += 1
        }
    }
    return candidate
}

// чтение опыта
func readExperience(_ data: [String], i: inout Int, textArr: inout [String]) -> [WorkExperience?]? {
    var work: [WorkExperience?]? = []
    i += 1
    while textArr[i] != "" {
        var tmp: WorkExperience?
        if (textArr[i] == "##" && textArr[i+1] != "" && textArr[i+2] != "" && textArr[i+3] != "") {
            tmp = WorkExperience(period: textArr[i+1], companyName: textArr[i+2], description: "")
            i += 3
            while textArr[i] != "" && textArr[i] != "##" {
                tmp?.description += textArr[i]
                i += 1
            }
            work?.append(tmp)
        } else {
            break
        }
    }
    return work
}

// экспорт в файл
func exportText(_ data: String, fileName: String) {
    let dir = "Swift"
    var path = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0].appendingPathComponent(dir)

    do {
        // создание дериктории
        try FileManager.default.createDirectory(atPath: path.path(), withIntermediateDirectories: true, attributes: nil)
        
        path = path.appendingPathComponent(fileName)
        
        // запись в файл
        try data.write(to: path, atomically: false, encoding: .utf8)
        
    } catch {
        print("Error write File")
    }
}

// чтение файла
func readFile(candidateInfo: inout CandidateInfo?, educationInfo: inout EducationInfo?, workExperience: inout [WorkExperience?]?, freeBlock: inout FreeBlock?) -> Bool {
    // экспортируемый текст
    var expText: String = ""
    // строка
    var textArr: [String] = []
    // ошибка
    var error = false
    
    // поиск файла в ресурсах приложения
    if let filePath = Bundle.main.path(forResource: "resume", ofType: "txt") {
        if let text = try? String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8) {
            expText = text
            textArr = text.components(separatedBy: "\n")
        }
        var i = 0
        while i < textArr.count {
            switch textArr[i] {
            case "# Candidate info":
                candidateInfo = readInfo(textArr, i: &i, textArr: &textArr)
                if candidateInfo == nil {
                    error = true
                    break
                }
            case "# Education":
                educationInfo = readEducInfo(textArr, i: &i, textArr: &textArr)
                if educationInfo == nil {
                    error = true
                    break
                }
            case "# Job experience":
                workExperience = readExperience(textArr, i: &i, textArr: &textArr)
                if workExperience == nil {
                    error = true
                    break
                }
            case "# Free block":
                i += 1
                freeBlock = FreeBlock(description: "")
                while textArr[i] != "" {
                    freeBlock?.description += textArr[i]
                    i += 1
                }
            default:
                error = true
                break
            }
            i += 1
        }
    } else {
        print("Файл resume.txt найден")
    }
    
    if !error {
        exportText(expText, fileName: "export.txt")
    }
    
    return error
}

// чтение тегов
func readTag() -> [String] {
    // строка
    var textArr: [String] = []
    if let filePath = Bundle.main.path(forResource: "tags", ofType: "txt") {
        if let text = try? String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8) {
            textArr = text.components(separatedBy: "\n")
        }
    } else {
        print("Файл tags.txt найден")
    }
    
    return textArr
}

// для сотрировки значений
func updateFrequencyDictionary(from string: String?, to: inout [String: Int]) {
    guard let components = string?.components(separatedBy: [" ", ".", ")"]) else {
        return
    }
    components.forEach { word in
        let trimmedWord = word.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedWord.isEmpty {
            to[trimmedWord, default: 0] += 1
        }
    }
}

// анализ
func analysis(educationInfo: EducationInfo?, workExperience: [WorkExperience?], freeBlock: FreeBlock?) {
    
    // словарь слов
    var frequencyDictionary = [String: Int]()
    
    for item in workExperience {
        updateFrequencyDictionary(from: item?.description, to: &frequencyDictionary)
    }
    
    // Обновление словаря для freeBlock.description
    updateFrequencyDictionary(from: freeBlock?.description, to: &frequencyDictionary)

    // Обновление словаря для EducationInfo.description
    updateFrequencyDictionary(from: educationInfo?.description, to: &frequencyDictionary)
    
    let sortedDictionary = frequencyDictionary.sorted(by: { $0.value > $1.value })
    
    var resultWord: String = "# Words"
    var resultTags: String = "# Matched tags"
    let tags = readTag()
 
    // Вывод отсортированного словаря
    for (key, value) in sortedDictionary {
        if tags.contains(key) {
            resultTags += "\n\(key)"
        }
        resultWord += "\n\(key): \(value)"
    }
    
    let result = resultWord + "\n\n" + resultTags
    
    exportText(result, fileName: "analysis.txt")
}
