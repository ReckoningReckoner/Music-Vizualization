/**
 * Creates balls for loud audio levels
 * Balls are larger than the super class and move faster
 * Levels are found using Root mean square
 *
 * @author Viraj Bangari
 * @version 1.0
 * @since Processing 2.1
 * @since Nov 2014
 */
class Loudball extends Explodingball {
  /**
   * Initializes Loudball. Determines radius, speed, location and gravity.
   *
   * @param radius the radius of each ball
   */
  Loudball(float radius_) {
    super(radius_);
    speed = new PVector(random(-7, 7), random(-7, 7));
  }

  /**
   * Draws balls on screen
   * Ball has a slightler darker fill than the inherited class
   */
  void drawBall() {
    noStroke();
    fill(#7E1379, alpha);
    ellipse(location.x, location.y, radius, radius);
  }
}

