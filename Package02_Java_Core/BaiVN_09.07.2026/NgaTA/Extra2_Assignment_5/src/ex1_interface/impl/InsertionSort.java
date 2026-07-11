package ex1_interface.impl;

import ex1_interface.ISort;

public class InsertionSort extends SequenceNumber implements ISort {

    public InsertionSort(int n) {
        super(n);
    }

    @Override
    public void sort() {
        int[] arr = getNumbers();

        for (int i = 1; i < arr.length; i++) {
            int key = arr[i];
            int j = i - 1;

            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }

            arr[j + 1] = key;
        }
    }
}