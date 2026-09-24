package Interface;

public class InsertSort extends SequenceNumber implements Sort {

    public InsertSort(int n) {
        super(n);
    }

    @Override
    public void sort() {

        for (int i = 1; i < numbers.length; i++) {

            int key = numbers[i];
            int j = i - 1;

            while (j >= 0 && numbers[j] > key) {
                numbers[j + 1] = numbers[j];
                j--;
            }

            numbers[j + 1] = key;
        }
    }
}
