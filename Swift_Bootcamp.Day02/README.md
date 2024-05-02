### Have a nice day!  

It's time to learn more about various collections and their conversion functions. The Swift developers have tried to make working with data in collections as convenient as possible. Especially pleasing is the great variety of methods, and the possibility to make them even more by extensions.
Let's also pay a little attention to operation with files -  reading and writing.

## Topics:
- Collections
- In/out: files
- Functional types
- Closure

### Project: Job Search

A common case is when the user needs to display data taken from different sources/entities. For this purpose, the view layer usually has special entities that have the necessary fields and properties to display, which are filled with data before displaying them. Converting some entities to other entities must not change the original values in any way (immutability principle).

## Tasks

**Requirement!** Create a workspace inside the src folder named day02. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day02/quest1, day02quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Looking for job interviews
A simple example of using the conversion function is a preview list containing partial information about an object.

**Tip!** There are several examples of collection conversions (`map`, `filter`) in the `data-sample` folder. Use them to do your tasks.

Create a collection of companies, each described as follows:
- Name
- Activity (IT, Banking, Public services)
- Description
- A list of jobs, each of which contains information about the profession (Developer, QA, Project Manager, Analyst, Designer), level (junior, middle, senior) and expected salary level
- List of required skills (for example, ["swift", "CoreData", "Realm"])
- Contacts

The company object must also have a method of interview type (Int, Candidate) -> Bool(company vacancy number and entry candidate) that describes the hiring process at each company and its result. The candidate object must include identical company fields:
- Name
- Profession (Developer, QA, Project Manager, Analyst, Designer)
- Level (junior, middle, senior)
- Expected salary level
- Skills

The candidate can be one for the whole code, for simplicity write the data of the object in the code.

The interview function should have the logic of checking the availability of skills for the vacancy - 
if the match is less than 50%, the candidate will not be hired. If the candidate has 50% or more of the skills necessary for the job, then the result of the function should be a random value true or false.

You must have at least 5 companies with different fields, professions, candidate levels and salaries. For simplicity, write them down in code.

Using the candidate's data, output a suitable list of vacancies for him according to the parameters of the profession and salary.
Next, the number of the vacancy for which the interview will be conducted is entered from the keyboard.
The hiring company object uses the `interview` method, the result of which will be displayed on the screen.

The vacancy number entered from the keyboard must be integer.
If the input is incorrect, the program outputs "It doesn't look like a correct input.". and requests data again.

_Example_

_Candidate_
```
Candidate:
- Name: Ivan
- Profession: Analyst
- Level: Junior
- Salary: 100000
- Skills: ["python", "matlab"]
```
```
Banking. Analyst. Junior. >= 100000
The list of suitable vacancies:

1.
Junior Analyst     ---      >= 100000
  OOO "SuperPay"
  Banking
  ["python", "matlab", "tensorflow", "excel"]
---------------------------------------

1. 
Junior Analyst     ---      >= 100000
  MMM
  Public services
  ["excel", "access"]
---------------------------------------

3.
Junior Analyst     ---      >= 100000
  CryptoSuperGo
  Banking
  ["python", "sql", "matlab", "pandas"]
---------------------------------------

3

Processing Interview...
Success, candidate was applied.
```

### Task 2. Analyzing resumes
Let's write an algorithm that allows analyzing resumes and generating tags based on them.

The resume has a template:
- Candidate information block
  - Full name
  - Profession (the list of professions is the same as in the previous task)
  - Sex
  - Birth date
  - Contacts (e-mail)
- Education information Block. For each educational institution:
    - Type
    - Years of study
    - Description
-Work experience block. For each place of work:
    - Working period
    - Company name and if there are contacts
    - Description
- Block about yourself in free text form

Our tool recognizes template blocks and creates corresponding objects filled with data from the resume.
- The text is analyzed by words that are compared to a tag cloud.
- There is a mechanism for exporting resumes
  
**Input data:**   
  - _resume.txt_ - it must be filled out following the sample resume
  - _tags.txt_ - it must be filled with the original set of tags (at least 3 words)
  - _export.txt_
  - _analysis.txt_

**Output data:**  
Check the correctness of the algorithms: 
- In the _export.txt_ file, transfer the data from the objects according to the resume template. 
- After that, the files _resume.txt_ and _export.txt_ must match (you can check in online editors) 

Output to the _analysis.txt_ file:
- Section with each word from the text (once) with the number of repetitions in the format: "developer - 42", in descending order by number
- Section with words that match the words in the _tags.txt_ file (there must be at least 3)

File examples - [resume.txt](data-samples/resume.txt), [tags.txt](data-samples/tags.txt), [analysis.txt](data-samples/analysis.txt) in data-samples folder.

### Bonus task 3. Ready for retirement
Link the candidate's level to his experience.
So, junior - less than a year, middle - from one to three years (not inclusive), senior - three years or more.

Output the list of vacancies suitable for the candidate's profession and seniority, calculated by the sum of work experience in the _analysis.txt_ section. Use the list of vacancies from Task 1

Example for [analysis.txt](data-samples/analysis.txt) in data-samples folder.

### Bonus task 4. Big data
Let's create a simple analytics mechanism:
- Add a _notATag.txt_ file to store conjunctions, pronouns, and other non-tag words (at least 12 words).
- Based on this file, filter the resume by sending the words that do not match either _tags.txt_ or _notATag.txt_ to the _analysis.txt_ file in the "Possible tags" section

Example for [notATag.txt](data-samples/notATag.txt) and [analysis.txt](data-samples/analysis.txt) in data-samples folder.

### Bonus task 5. Text comparison
Add a mechanism to compare the texts of imported and exported resumes

**Output data:** output the result of the comparison of two text files to the console

_Example:_
```
Text comparator: resumes are identical
```
