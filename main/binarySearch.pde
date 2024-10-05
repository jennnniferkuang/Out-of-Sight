int binarySearch(ArrayList<String> arr, String s){
  bubbleSort(arr);
  
  int lowerI = 0;
  int higherI = arr.size() - 1;
  
  while(lowerI <= higherI){
    int midI = (lowerI + higherI) / 2;
    String e = arr.get(midI);
    
    if (e.equalsIgnoreCase(s))
      return midI;
      
    else if (e.compareToIgnoreCase(s) < 0)
      lowerI = midI + 1;
      
    else
      higherI = midI - 1;
  }
      
  return -1; // not found
} // end binarySearch


void bubbleSort(ArrayList<String> arr){
  boolean swap = true;
  
  while(swap){
    swap = false;
    
    for (int i = 0; i < arr.size() - 1; i++){
      if (arr.get(i).compareToIgnoreCase(arr.get(i+1)) > 0){
        String temp = arr.get(i);
        arr.set(i, arr.get(i+1));
        arr.set(i+1, temp);
        swap = true;
      }
    }
  }
} // end bubbleSort
