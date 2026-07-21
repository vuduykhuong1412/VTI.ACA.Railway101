package Interface;

public class QuickSort extends SequenceNumber implements Sort {

    public QuickSort(int n) {
        super(n);
    }

    @Override
    public void sort() {
        quickSort(0, numbers.length - 1);
    }

    private void quickSort(int left, int right) {

        int i = left;
        int j = right;

        int pivot = numbers[(left + right) / 2];

        while (i <= j) {

            while (numbers[i] < pivot) {
                i++;
            }

            while (numbers[j] > pivot) {
                j--;
            }

            if (i <= j) {
                int temp = numbers[i];
                numbers[i] = numbers[j];
                numbers[j] = temp;

                i++;
                j--;
            }
        }

        if (left < j) {
            quickSort(left, j);
        }

        if (i < right) {
            quickSort(i, right);
        }
    }
}