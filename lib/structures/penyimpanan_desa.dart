import '../models/desa.dart';
import '../models/pengabdian.dart';

class PenyimpananDesa {
    final List<Desa> listDesa = [];
    final Map<int, Desa> mapDesa = {};

    void tambahDesa(Desa desa) {
        if (mapDesa.containsKey(desa.idDesa)) {
            print('\nID desa sudah digunakan!');
            return;
        }
        
        listDesa.add(desa);
        mapDesa[desa.idDesa] = desa;

        print('\nData desa berhasil ditambahkan!');
    }

    void tambahRiwayatPengabdian(
        int idDesa, Pengabdian pengabdian) {
            if (mapDesa.containsKey(idDesa)) {
                mapDesa[idDesa]!.tambahPengabdian(pengabdian);

                print('\nRiwayat pengabdian berhasil ditambahkan!');
            } else {
                print('\nID desa tidak ditemukan!');
            }
        }

    void tampilSemuaDesa() {
        if (listDesa.isEmpty) {
            print('\nData desa masih kosong.');
            return;
        }

        print('\n===== DATA DESA =====');

        for (int i = 0; i < listDesa.length; i++) {
            print('\nData ke-${i + 1}');
            listDesa[i].tampilInfo();

        print('--------------------------');
        }
    }
}