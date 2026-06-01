import 'dart:io';
import '../models/desa.dart';
import '../models/pengabdian.dart';
import '../structures/penyimpanan_desa.dart';
import '../structures/sorting.dart';
import '../structures/detail_desa.dart';
import '../structures/queue.dart';  
import '../structures/searching.dart';  
import '../data/desa.csv';
import '../data/pengabdian.csv';

void tampilMenu() {
    print('\n================================');
    print('APLIKASI DESA PENGABDIAN');
    print('================================');
    print('1. Tambah Data Desa');
    print('2. Tambah Riwayat Pengabdian');
    print('3. Cari Desa Berdasarkan Nama');
    print('4. Cari Desa Berdasarkan Potensi');
    print('5. Cari Berdasarkan Jumlah Pengabdian');
    print('6. Lihat Semua Desa');
    print('7. Urutkan Desa');
    print('8. Detail Desa');
    print('9. Keluar');
    print('================================');

    stdout.write('Pilih menu : ');
}

void main() {
    ManagerDesa manager = ManagerDesa();

    QueuePencarian queuePencarian = QueuePencarian();

    Desa desa1 = Desa(
        1,
        'Desa Wringinpitu',
        'Jawa Timur',
        'Banyuwangi',
        'Pertanian',
        'Kurang irigasi',
    );

    Desa desa2 = Desa(
        2,
        'Desa Sumberagung',
        'Jawa Timur',
        'Banyuwangi',
        'Perikanan',
        'Kurang modal',
    );

    Pengabdian p1 = Pengabdian(
        2024,
        JenisPengabdian.teknologi,
        'Poliwangi',
        'Pelatihan aplikasi',
    );

    desa1.tambahPengabdian(p1);

    manager.tambahDesa(desa1);
    manager.tambahDesa(desa2);

    bool jalan = true;

    while (jalan) {
        tampilMenu();

        int pilihan = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        switch (pilihan) {
            case 1: print('\n===== TAMBAH DESA =====');

            stdout.write('ID Desa : ');
            int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            stdout.write('Nama Desa : ');
            String nama = stdin.readLineSync() ?? '';

            stdout.write('Provinsi : ');
            String provinsi = stdin.readLineSync() ?? '';

            stdout.write('Kabupaten : ');
            String kabupaten = stdin.readLineSync() ?? '';

            stdout.write('Potensi : ');
            String potensi = stdin.readLineSync() ?? '';

            stdout.write('Permasalahan : ');
            String masalah = stdin.readLineSync() ?? '';

            Desa desaBaru = Desa(
                id,
                nama,
                provinsi,
                kabupaten,
                potensi,
                masalah,
            );

            manager.tambahDesa(desaBaru);

            break;

            case 2: print('\n===== TAMBAH PENGABDIAN =====');

            stdout.write('ID Desa : ');
            int idDesa = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            stdout.write('Tahun : ');
            int tahun = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            print('1. Kesehatan');
            print('2. Pendidikan');
            print('3. Teknologi');
            print('4. Lingkungan');

            stdout.write('Pilih jenis : ');
            int pilihJenis = int.tryParse(stdin.readLineSync() ?? '') ?? 1;

            JenisPengabdian jenis;

            switch (pilihJenis) {
                case 1:
                jenis = JenisPengabdian.kesehatan;
                break;

                case 2:
                jenis = JenisPengabdian.pendidikan;
                break;

                case 3:
                jenis = JenisPengabdian.teknologi;
                break;

                case 4:
                jenis = JenisPengabdian.lingkungan;
                break;

                default:
                jenis = JenisPengabdian.kesehatan;
            }

            stdout.write('Institusi : ');
            String institusi = stdin.readLineSync() ?? '';

            stdout.write('Deskripsi : ');
            String deskripsi = stdin.readLineSync() ?? '';

            Pengabdian pengabdian = Pengabdian(
                tahun,
                jenis,
                institusi,
                deskripsi,
            );

            manager.tambahRiwayatPengabdian(
                idDesa,
                pengabdian,
            );
            break;

            case 3:
            stdout.write('\nMasukkan nama desa : ');
            String keyword = stdin.readLineSync() ?? '';

            queuePencarian.tambahPencarian('Cari Nama Desa : $keyword');
            manager.cariDesaNama(keyword);
            break;

            case 4:
            stdout.write('\nMasukkan potensi : ');
            String potensi = stdin.readLineSync() ?? '';

            queuePencarian.tambahPencarian('Cari Potensi : $potensi');
            manager.cariDesaPotensi(potensi);
            break;

            case 5:
            stdout.write('\nMasukkan jumlah pengabdian : ');
            int jumlah = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            queuePencarian.tambahPencarian('Cari Jumlah Pengabdian : $jumlah');
            manager.cariJumlahPengabdian(jumlah);
            break;

            case 6:
            manager.tampilSemuaDesa();
            break;

            case 7:
            print('\n1. Urut Nama Desa');
            print('2. Urut Jumlah Pengabdian');

            stdout.write('Pilih : ');
            int pilihUrut = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            switch (pilihUrut) {
                case 1:
                manager.urutNamaDesa();
                manager.tampilSemuaDesa();
                break;

                case 2:
                manager.urutJumlahPengabdian();
                manager.tampilSemuaDesa();
                break;

                default:
                print('Pilihan tidak valid!');
            }
            break;

            case 8:
            stdout.write('\nMasukkan ID Desa : ');
            int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
            
            manager.detailDesa(id);
            break;

            case 9:
            print('\nProgram selesai.');
            jalan = false;

            break;

            default: print('\nPilihan tidak valid!');
        }
    }
}