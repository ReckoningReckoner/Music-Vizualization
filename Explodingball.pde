/**
 * Creates balls for medium audio levels. 
 * Levels are found using Root mean square
 *
 * @author Viraj Bangari
 * @version 1.0
 * @since Processing 2.1
 * @since Nov 2014
 */
class Explodingball {

  float radius;
  float alpha = 150;
  PVector location ;
  PVector speed;
  PVector deceleration;

  /**
   * Initializes Explodingball. Determines radius, speed, location and gravity.
   *
   * @param radius the radius of each ball
   */
  Explodingball(float radius_) {
    radius = radius_;
    location = new PVector(width/2, height/2);
    speed = new PVector(random(-5, 5), random(-5, 5));
    deceleration = new PVector(0, 0.1);
  }

  /**
   * Runs the code for each ball
   */
  void run() {
    drawBall();
    updateBall();
  }

  /**
   * Draws balls on screen
   */
  void drawBall() {
    noStroke();
    fill(#AF12A8, alpha);
    ellipse(location.x, location.y, radius, radius);
  }

  /**
   * Updates the position moving balls on screen
   * Deceleration attracts the object closer to the bottom of the window
   * The balls become less opaque as the program runs
   */
  void updateBall() {
    alpha -= 1;
    location.add(speed);
    speed.add(deceleration);
  }

  /**
   * Returns a boolean if the objects have been on screen for too long
   * Only returns true if the object is "invisible" (based on the alpha)
   *
   * @return true if the object is invisible
   */
  boolean tooFar() {
    if (alpha <=0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

