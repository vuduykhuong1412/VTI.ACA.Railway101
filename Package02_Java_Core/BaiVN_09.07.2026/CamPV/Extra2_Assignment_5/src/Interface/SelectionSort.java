package Interface;

public class SelectionSort extends SequenceNumber implements Sort {

    public SelectionSort(int n) {
        super(n);
    }

    @Override
    public void sort() {

        for (int i = 0; i < numbers.length - 1; i++) {

            int min = i;

            for (int j = i + 1; j < numbers.length; j++) {

                if (numbers[j] < numbers[min]) {
                    min = j;
                }
            }

            int temp = numbers[min];
            numbers[min] = numbers[i];
            numbers[i] = temp;
        }
    }
}