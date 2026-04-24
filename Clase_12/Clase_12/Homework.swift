//
//  Homework.swift
//  Clase_12
//
//  Created by Alumno on 22/4/26.
//

enum CourseLevel: String {
    case basic = "Basico"
    case intermidate = "Intermedio"
    case advanced = "Avanzado"
}

struct Student {
    let id: Int
    let name: String
    let age: Int
    let email: String
}

class Courses {
    let code: String
    let name: String
    let level: CourseLevel
    let MaxCapacity: Int
    var registered: [Student]
    
    // Constructor
    init(code: String, name: String, level: CourseLevel, MaxCapacity: Int) {
        self.code = code
        self.name = name
        self.level = level
        self.MaxCapacity = MaxCapacity
        self.registered = []
    }
    
    func registered(student: Student) -> Bool {
        if registered.count < MaxCapacity {
            registered.append(student)
            return true
        }
        
        // Si es Falso para que no pase en Sistema
        return false
    }
}

// Class Registered
class Registered_Course {
    let student: Student
    let course: Courses
    var grades: [Double]
    
    init(student: Student, course: Courses) {
        self.student = student
        self.course = course
        self.grades = []
    }
    
    func addGrade(grade: Double) {
        grades.append(grade)
    }
    
    var average: Double {
        return 0.0
    }
}

class CampusSystem {
    var students: [Student]
    var courses: [Courses]
    var registeredCourse: [Registered_Course]
    
    init() {
        self.students = []
        self.courses = []
        self.registeredCourse = []
    }
    
    func AddStudent(student: Student) {
        guard !student.name.isEmpty else {
            print("The name of sudent can't be empty")
            return
        }
        
        guard student.age < 16 else {
            print("You must be at least 16 years old ")
            return
        }
        
        guard student.email.contains("@") else {
            print("The email can't be validate")
            return
        }
        
        // AddStudent
        students.append(student)
        print("Student \(student.name) add corrected")
    }
    
    func AddCourse(course: Courses) {
        self.c
        
        print("Course \(course) add corrected")
        
        
    }
    
    func Record (studentID: Int, codeCourse: String) {
        
    }
    
    func AddGrades (studentID: Int, codeCourse: String, grade: Double) {
        
    }
}
    

// People
let estudiante1 = Student(id: 1, name: "Esteban", age: 28, email: "esteb@gmail.com")
let estudiante2 = Student(id: 2, name: "Esteban", age: 28, email: "esteb@gmail.com")
let estudiante3 = Student(id: 3, name: "Esteban", age: 28, email: "esteb@gmail.com")

//let course1 = Courses(code: )
