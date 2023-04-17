class Cycle {
  PVector position, velocidad;
  float grosor = 1.5;
  float cycle = 0.0;
  float cycleDisplacement = 0.0;
  color gridColorLine = color(0);

  Cycle( StringDict tidalLayer ) {
    position = new PVector(width-offsetSubdivision, 0);
    velocidad = new PVector(-movSequenser, 0.0);

    if ( tidalLayer.hasKey("gridweight") ) {
      grosor = parseInt( tidalLayer.get("gridweight") );
    } else {
      cycleDisplacement = float( tidalLayer.get("cycle") ) % 1;
      grosor = ( cycleDisplacement == 0.0) ? 1.5 : 0.5;
    }

    if ( tidalLayer.hasKey("color") ) {
      String colorLayer = "FF"+tidalLayer.get("color");
      gridColorLine = color( unhex(colorLayer) );
    }

  }

  void draw() {
    noFill();
    stroke(gridColorLine);
    position.add(velocidad);
    strokeWeight(grosor);
    line(position.x, position.y, position.x, height);
    if ( position.x < -30 ) {
      cycles.remove(this);
    }
  }
}
