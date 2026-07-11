package ex1_interface.impl;

import ex1_interface.ISort;
import ex1_interface.common.Common;

public class SelectionSort extends SequenceNumber implements ISort {

    public SelectionSort(int n) {
        super(n);
    }

    @Override
    public void sort() {
        int[] arr = getNumbers();

        for (int i = 0; i < arr.length - 1; i++) {
            int minIndex = i;

            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }

            Common.swap(arr, i, minIndex);
        }
    }
}