/**
 * Creates balls for quiet audio levels
 * Balls are smaller than the super class and move slower
 * Levels are found using Root mean square
 *
 * @author Viraj Bangari
 * @version 1.0
 * @since Processing 2.1
 * @since Nov 2014
 */
class Quietball extends Explodingball {
  Quietball(float radius_) {
    super(radius_);
    speed = new PVector(random(-2, 2), random(-2, 2));
  }

  /**
   * Draws balls on screen
   * Ball has a slightler darker fill than the inherited class
   */
  void drawBall() {
    noStroke();
    fill(#E81ADE, alpha);
    ellipse(location.x, location.y, radius, radius);
  }
}

