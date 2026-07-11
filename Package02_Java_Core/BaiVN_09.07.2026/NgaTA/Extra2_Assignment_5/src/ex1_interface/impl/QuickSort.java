package ex1_interface.impl;

import ex1_interface.ISort;
import ex1_interface.common.Common;

public class QuickSort extends SequenceNumber implements ISort {

    public QuickSort(int n) {
        super(n);
    }

    @Override
    public void sort() {
        int[] arr = getNumbers();
        quickSort(arr, 0, arr.length - 1);
    }

    private void quickSort(int[] arr, int left, int right) {
        if (left < right) {
            int pivotIndex = partition(arr, left, right);

            quickSort(arr, left, pivotIndex - 1);
            quickSort(arr, pivotIndex + 1, right);
        }
    }

    private int partition(int[] arr, int left, int right) {
        int pivot = arr[right];
        int smallerIndex = left - 1;

        for (int currentIndex = left;
             currentIndex < right;
             currentIndex++) {

            if (arr[currentIndex] <= pivot) {
                smallerIndex++;

                Common.swap(
                        arr,
                        smallerIndex,
                        currentIndex
                );
            }
        }

        Common.swap(arr, smallerIndex + 1, right);

        return smallerIndex + 1;
    }
}