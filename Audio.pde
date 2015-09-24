/**
 * Generates a visualization of mp3 file.
 *
 * @author Viraj Bangari
 * @version 1.0
 * @since Processing 2.1
 * @since Nov 2014
 */


import ddf.minim.*;
Minim minim;
AudioPlayer song;

ArrayList<Explodingball> ball;

/**
 * Creates processing canvas and plays an audio file
 * Allows the usage of the minim class
 */
void setup() {
  minim = new Minim(this);
  ball = new ArrayList<Explodingball>();
  song = minim.loadFile("Chen Singing.mp3");
  size(1080, 620);
}


/**
 * Runs the code for each ball object
 * Generates a new object based on the level of the audio files
 * Large circle in center of the screen is generated. Radius is based on the song levels function. Emulates a subwoofer.
 * Draws a line in the center of the screen that uses the get() function to display sinosodial wave of the sound function.
 * The left half of the wave corresponds with the right channel, and the left half corresponds with the left channel.
 */
void draw() {
  background(40);
  song.play();

  float m = map(song.mix.level(), 0, 1, 0, 100);  //The level of the song mappped to a value from 0 to 100

  noStroke();
  fill(#931B8D, 80);
  ellipse(width/2, height/2, m*4, m*4); //The "subwoofer"

  println(m);
  if (m > 2) {
    ball.add(new Quietball(m)); //add a small sized ball
  }
  if (m > 10) {
    ball.add(new Explodingball(m*1.4));  //add a medium sized ball
  } 
  if (m > 17) {
    ball.add(new Loudball(m*1.6));  //add a medium sized ball
  }

  for (int i = 0; i < ball.size(); i++) {
    ball.get(i).run();
    if (ball.get(i).tooFar()) {
      ball.remove(i);
    }
  }

  displayWave(song.mix.size()-1);
}


/** 
 * Code for displays the central wave
 * The left half of the wave corresponds with the right channel, and the left half corresponds with the left channel.
 * Each point on the wave corresponds with a different index on the song array
 * Because there are only a limited number of iterms in the song array, the sound wave may need to repeated depending on the length of the song
 * The modulus value allows the waves to repeat while preventing the index value from going past the number of items in the song array.
 *
 * @param songLength The Array length automatically created by minim when and mp3 file is loaded.
 */
void displayWave(int songLength) {
  for (int i = 0; i < width; i ++) {
    int index = i; 
    if (index >= songLength) {
      index %= songLength; //Used so the index value never goes past the the number of items in the song array
    }
    if (i < width/2) { //left sound channel
      ellipse(i, height/2+20*song.left.get(index), 2, 2);
    } 
    else if (i >= width/2) { //right sound channel
      ellipse(i, height/2+20*song.right.get(index), 2, 2);
    }
  }
}

