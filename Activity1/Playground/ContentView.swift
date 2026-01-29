import UIKit

let nombre = "Tu Nombre Aquí" // Reemplaza con tu nombre real
print("¡Hola! Mi nombre es: \(nombre)")

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
label.text = "Nombre: \(nombre)"
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
label.textColor = .blue

label

