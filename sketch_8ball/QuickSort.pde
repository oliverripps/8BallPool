import java.util.*; //random, scanner, arraylist
import java.io.*; //file, filenotfoundexception



  private static int partition(int[] data, int start, int end){
        if(start == end){
            return end;
        }
        Random randgen = new Random();
        int pivot = start + randgen.nextInt(end - start);
        int upper = end;
        int lower = start + 1;
        int value = data[pivot];
        swap(data, pivot, start);
        while(upper >= lower){
            if(data[lower] > data[start]){
                swap(data, upper, lower);
                upper--;
            }else{
                lower++;
            }
        }
        swap(data, start, upper);
        return upper;
    }

  public static int quickselect(int[] data, int k){
    int start = 0;
    int end = data.length-1;
    int x = partition(data, start, end);
    while (x != k){
      if (x < k){
        start = x + 1;
        x = partition(data, start, end);
      }
      if (x > k){
        end = x - 1;
        x = partition(data, start, end);
      }
    }
    return data[x];
  }

  public static void quicksort(int[] data){
    quicksortH(data, 0, data.length-1);
  }


  public static void quicksortH(int[] data, int lo, int hi){
    if( lo >= hi){
      return;
    }
    int pivot = partition(data, lo, hi);
    quicksortH(data, pivot+1, hi);
    quicksortH(data, lo, pivot-1);
  }

  private static void swap(int[] data, int x, int y){
    int hold = data[x];
    data[x] = data[y];
    data[y] = hold;
  }

  public static String toString(int[] data){
    String s = "[";
    for (int i = 0; i < data.length; i++){
      s = s + data[i] + ", ";
    }
    s += "]";
    return s;
  }
