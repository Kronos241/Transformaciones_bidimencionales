int transformacion = 0; // Variable para almacenar la opción de transformación
float animacion = 0;    // Variable para animar la transformación

void setup() {
  size(400, 400);
}

void draw() {
  background(220);
  
  translate(width / 2, height / 2); // Mueve el origen al centro
  
  switch (transformacion) {
    case 1:
      traslacion(); // Llama a la función de traslación
      break;
    case 2:
      escalamiento(); // Llama a la función de escalamiento
      break;
    case 3:
      rotacion(); // Llama a la función de rotación
      break;
    case 4:
      sesgado(); // Llama a la función de sesgado
      break;
    default:
      // No se aplica ninguna transformación
  }
  
  rect(-25, -25, 50, 50);
  
  // Animación
  animacion += 0.02;
  if (animacion > TWO_PI) {
    animacion = 0;
  }
}

void keyPressed() {
  // Usa las teclas numéricas para seleccionar la transformación
  if (key == '1') {
    transformacion = 1; // Traslación
  } else if (key == '2') {
    transformacion = 2; // Escalamiento
  } else if (key == '3') {
    transformacion = 3; // Rotación
  } else if (key == '4') {
    transformacion = 4; // Sesgado
  } else {
    transformacion = 0; // Ninguna transformación
  }
}

void traslacion() {
  float xOffset = 100 * sin(animacion); // Animación de traslación
  translate(xOffset, 0); // Traslación en x
}

void escalamiento() {
  float scaleFactor = 1.5 + 0.5 * sin(animacion); // Animación de escalamiento
  scale(scaleFactor); // Escalamiento
}

void rotacion() {
  float rotationAngle = radians(45) * sin(animacion); // Animación de rotación
  rotate(rotationAngle); // Rotación
}

void sesgado() {
  float skewFactorX = 0.5 * sin(animacion); // Animación de sesgado en x
  float skewFactorY = 0.2 * sin(animacion); // Animación de sesgado en y
  applyMatrix(1, skewFactorX, skewFactorY, 1, 0, 0); // Sesgado
}
