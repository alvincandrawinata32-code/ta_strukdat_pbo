import '../models/desa.dart';

class Sorting {
    final List<Desa> listDesa;

    Sorting(this.listDesa);

    void urutNamaDesa() {
        int n = listDesa.length;

        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (listDesa[j]
                .namaDesa
                .toLowerCase()
                .compareTo(listDesa[j + 1] .namaDesa .toLowerCase(), ) > 0) {
                    Desa temp = listDesa[j];
                    listDesa[j] = listDesa[j + 1];
                    listDesa[j + 1] = temp;
                }
            }
        }

        print('\nData berhasil diurutkan.');
    }

    void urutJumlahPengabdian() {
        int n = listDesa.length;

        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (listDesa[j] .riwayatPengabdian .length < listDesa[j + 1] .riwayatPengabdian .length) {
                    Desa temp = listDesa[j];
                    listDesa[j] = listDesa[j + 1];
                    listDesa[j + 1] = temp;
                }
            }
        }

        print('\nData berhasil diurutkan.');
    }
}