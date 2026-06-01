import '../models/desa.dart';

class Searching {
    final List<Desa> listDesa;

    Searching(this.listDesa);

    void cariDesaNama(String keyword) {
        bool ketemu = false;

        print('\n===== HASIL PENCARIAN =====');

        for (int i = 0; i < listDesa.length; i++) {
            if (listDesa[i] .namaDesa .toLowerCase() .contains(keyword.toLowerCase())) {
                listDesa[i].tampilInfo();

                print('--------------------------');

                ketemu = true;
            }
        }

        if (!ketemu) {
            print('Data desa tidak ditemukan!');
        }
    }

    void cariDesaPotensi(String potensi) {
        bool ketemu = false;

        print('\n===== HASIL PENCARIAN =====');

        for (int i = 0; i < listDesa.length; i++) {
            if (listDesa[i] .potensi .toLowerCase() .contains(potensi.toLowerCase())) {
                listDesa[i].tampilInfo();

                print('--------------------------');

                ketemu = true;
            }
        }

        if (!ketemu) {
            print('Data desa tidak ditemukan!');
        }
    }

    void cariJumlahPengabdian(int jumlah) {
        bool ketemu = false;

        print('\n===== HASIL PENCARIAN =====');

        for (int i = 0; i < listDesa.length; i++) {
            if (listDesa[i].riwayatPengabdian.length == jumlah) {
                print('Nama Desa : ${listDesa[i].namaDesa}');
                print('Jumlah Pengabdian : ${listDesa[i].riwayatPengabdian.length}');
                ketemu = true;
            }
        }

        if (!ketemu) {
            print('Data desa tidak ditemukan!');
        }
    }
}