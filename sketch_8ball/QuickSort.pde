import java.util.*;


public static void insertionSort(int arr[]) {
  int i, key, j;
  for (i = 1; i < arr.length; i++) {
    key = arr[i];
    j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

public static int partition (int [] data, int start, int end) {
  if (start<0 || start>= data.length || end < 0 || end >= data.length) {
    throw new IndexOutOfBoundsException();
  }
  int r = start + (int)(Math.random() * (end - start + 1));
  int p = data[r];
  move(data, start, r);
  int hi = end;
  int low = start +1;
  while (low != hi) {
    if (p > data[low]) {
      low += 1;
    } else if (data[low] >= p) {
      move(data, low, hi);
      hi -= 1;
    }
  }
  if (data[low] < p) {
    move(data, start, low);
    return low;
  } else {
    move(data, start, low - 1);
    return low - 1;
  }
}

public static int[] dutchPartition(int[] data, int start, int end) {
  if (start == end) {
    return new int[] {start, start + 1};
  }
  int m = 0;
  if ((data[start] <= data[end] && data[start] >= data[start + (end - start)/2]) || (data[start] >= data[end] && data[start] <= data[start + (end - start)/2])) {
    m = start;
  }
  if ((data[end] <= data[start] && data[end] >= data[start + (end - start)/2]) || (data[end] >= data[start] && data[end] <= data[start + (end - start)/2])) {
    m = end;
  }
  if ((data[start + (end - start)/2] <= data[end] && data[start + (end - start)/2] >= data[start]) || (data[start + (end - start)/2] >= data[end] && data[start + (end - start)/2] <= data[start])) {
    m = start + (end - start)/2;
  }
  int pspot = m;
  int pivot = data[pspot];
  move(data, start, pspot);
  int s = start;
  int i = start;
  int e = end;
  while (i <= e) {
    if (data[i] > pivot) {
      move(data, i, e);
      e--;
    } else if (data[i] < pivot) {
      move(data, i, s);
      s++; 
      i++;
    } else {
      i++;
    }
  }

  return new int[] {s, e};
}



public static boolean check(int[] data, int index) {//checks if partition works
  int val=data[index];
  for (int i=0; i<index; i++) {
    if (data[i]==val) {
      return false;
    }
  }
  for (int i=index+1; i<data.length; i++) {
    if (data[i]==val) {
      return false;
    }
  }
  return true;
}

public static int quickselect(int[] data, int p) {
  if (p < 0 || p >= data.length) {
    throw new IllegalArgumentException() ;
  }
  int start = 0;
  int end = data.length-1;
  while (true) {
    int pivot = partition(data, start, end);
    if (p == pivot) {
      return data[p];
    }
    if (p < pivot) {
      end = pivot;
    } else { 
      start = pivot;
    }
  }
}

/*private static int quickselectHelper(int[] data, int k, int start, int end){
 int pivot = partition(data, start, end);
 if (k == pivot){
 return data[k];
 }
 else if (k < pivot){
 return quickselectHelper(data, k, start, pivot - 1);
 }
 else if (k > pivot){
 return quickselectHelper(data, k, pivot + 1, end);
 } else{
 return data[pivot];
 }
 }*/



public static void quicksort(int[] data) {
  if (data.length<175) {
    insertionSort(data);
  } else {
    quicksortH(data, 0, data.length-1);
  }
}
public static void quicksortH(int[] ary, int lo, int hi) {
  if (lo>=hi) {
    return;
  }
  int[] pivot=dutchPartition(ary, lo, hi);
  quicksortH(ary, lo, pivot[0]-1);
  quicksortH(ary, pivot[1]+1, hi);
}

private static void move(int[] data, int i1, int i2) {
  int temp = data[i1];
  data[i1] = data[i2];
  data[i2] = temp;
}
