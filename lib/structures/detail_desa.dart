import '../models/desa.dart';

class DetailDesa {
    final Map<int, Desa> mapDesa;

    DetailDesa(this.mapDesa);

    void detailDesa(int idDesa) {
        if (mapDesa.containsKey(idDesa)) {
            Desa desa = mapDesa[idDesa]!;

            print('\n===== DETAIL DESA =====');
            desa.tampilInfo();
            print('\nRiwayat Pengabdian');

            if (desa.riwayatPengabdian.isEmpty) {
                print('Belum ada riwayat.');
            } else {
                for (int i = 0;
                i < desa.riwayatPengabdian.length;
                i++) {
                    print('\nPengabdian ${i + 1}');
                    desa.riwayatPengabdian[i].tampilInfo();
                }
            }
        } else  {
            print('\nID desa tidak ditemukan!');
        }
    }
}