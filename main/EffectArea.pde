public class EffectArea{
  
  public float leftX, topY, rightX, bottomY, L, H;
  
  public EffectArea(float x, float y, float l, float h){
    leftX = x;
    topY = y;
    rightX = x + l;
    bottomY = y + h;
    L = l;
    H = h;
  } // end constructor
  
  public boolean insideArea(float x, float y, float l, float h){
    if ((leftX < x && x < rightX && topY < y && y < bottomY) || (leftX < (x+l) && (x+l) < rightX && topY < (y+h) && (y+h) < bottomY))
      return true;
    return false;
  } // return true if object (mouse or character) is within the effect area
  
  public void updateArea(float x, float y, float l, float h){
    leftX = x;
    topY = y;
    rightX = x + l;
    bottomY = y + h;
  } // updates all values
  
} // end EffectArea class
