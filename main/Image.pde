public class Image{
  
  public PImage image;
  public float l, h;
  public float x, y;
  
  public Image(String imageName, float initL, float initH){
    image = loadImage(imageName);
    l = initL;
    h = initH;
  } // end load new image
  
  public Image(PImage storedImage, float initL, float initH){
    image = storedImage;
    l = initL;
    h = initH;
  } // end load from stored image
  
  public Image(String imageName, float initL, float initH, float initX, float initY){
    image = loadImage(imageName);
    l = initL;
    h = initH;
    x = initX;
    y = initY;
  } // end overload with intial x, y value
  
  public Image(PImage storedImage, float initL, float initH, float initX, float initY){
    image = storedImage;
    l = initL;
    h = initH;
    x = initX;
    y = initY;
  } // end overload with intial x, y value from stored image
  
  public void changeImage(String imageName){
    image = loadImage(imageName);
  } // load new image by name
  
  public void changeImage(PImage newImage){
    image = newImage;
  } // switch image to stored image
  
  public void changeImage(EffectArea area, String imageName, float newL, float newH, float newX, float newY){
    image = loadImage(imageName);
    l = newL;
    h = newH;
    x = newX;
    y = newY;
    area.updateArea(x, y, l, h);
  } // load new image by name and update dimensions
  
} // end Image class
