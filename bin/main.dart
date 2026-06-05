import 'dart:io';
import '../lib/models/desa.dart';
import '../lib/models/pengabdian.dart';
import '../lib/models/jenis_pengabdian.dart';
import '../lib/structures/penyimpanan_desa.dart';
import '../lib/structures/sorting.dart';
import '../lib/structures/detail_desa.dart';
import '../lib/structures/queue.dart';  
import '../lib/structures/searching.dart'; 
import '../lib/data/kelola_csv.dart'; 

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
    print('9. Lihat Riwayat Pencarian');
    print('10. Hapus Riwayat Pencarian Terdepan');
    print('11. Keluar');
    print('================================');

    stdout.write('Pilih menu : ');
}

void main() {
    PenyimpananDesa dataDesa = PenyimpananDesa();

    KelolaCsv csv = KelolaCsv();
    csv.bacaDesa(dataDesa);
    csv.bacaPengabdian(dataDesa);
    
    Searching searching = Searching(dataDesa.listDesa);
    Sorting sorting = Sorting(dataDesa.listDesa);
    DetailDesa detail = DetailDesa(dataDesa.mapDesa);
    QueuePencarian queuePencarian = QueuePencarian();

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

            if (nama.trim().isEmpty) {
                print('Nama desa tidak boleh kosong!');
                break;
            }

            Desa desaBaru = Desa(
                id,
                nama,
                provinsi,
                kabupaten,
                potensi,
                masalah,
            );

            dataDesa.tambahDesa(desaBaru);
            csv.simpanDesa(dataDesa);

            break;

            case 2: print('\n===== TAMBAH PENGABDIAN =====');

            stdout.write('ID Desa : ');
            int idDesa = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            stdout.write('Tahun : ');
            int tahun = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            if (tahun <= 0) {
                print('Tahun tidak valid!');
                break;
            }

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

            dataDesa.tambahRiwayatPengabdian(
                idDesa,
                pengabdian,
            );
            csv.simpanPengabdian(dataDesa);
            break;

            case 3:
            stdout.write('\nMasukkan nama desa : ');
            String keyword = stdin.readLineSync() ?? '';

            queuePencarian.tambahPencarian('Cari Nama Desa : $keyword');
            searching.cariDesaNama(keyword);
            break;

            case 4:
            stdout.write('\nMasukkan potensi : ');
            String potensi = stdin.readLineSync() ?? '';

            queuePencarian.tambahPencarian('Cari Potensi : $potensi');
            searching.cariDesaPotensi(potensi);
            break;

            case 5:
            stdout.write('\nMasukkan jumlah pengabdian : ');
            int jumlah = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            queuePencarian.tambahPencarian('Cari Jumlah Pengabdian : $jumlah');
            searching.cariJumlahPengabdian(jumlah);
            break;

            case 6:
            dataDesa.tampilSemuaDesa();
            break;

            case 7:
            print('\n1. Urut Nama Desa');
            print('2. Urut Jumlah Pengabdian');

            stdout.write('Pilih : ');
            int pilihUrut = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

            switch (pilihUrut) {
                case 1:
                sorting.urutNamaDesa();
                dataDesa.tampilSemuaDesa();
                break;

                case 2:
                sorting.urutJumlahPengabdian();
                dataDesa.tampilSemuaDesa();
                break;

                default:
                print('Pilihan tidak valid!');
            }
            break;

            case 8:
            stdout.write('\nMasukkan ID Desa : ');
            int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
            
            detail.detailDesa(id);
            break;

            case 9:
            queuePencarian.tampilRiwayatPencarian();
            break;

            case 10:
            String? data = queuePencarian.hapusPencarian();

            if (data == null) {
                print('\nQueue kosong!');
            } else {
                print('\nData terhapus: $data');
            }
            break;

            case 11:
            print('\nProgram selesai.');
            jalan = false;
            break;

            default:
            print('\nPilihan tidak valid!');
        }
    }
}