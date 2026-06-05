import 'dart:io';

import '../models/desa.dart';
import '../structures/penyimpanan_desa.dart';
import '../models/pengabdian.dart';
import '../models/jenis_pengabdian.dart';

class KelolaCsv {

    void bacaDesa(PenyimpananDesa dataDesa) {
        final file = File('lib/data/desa.csv');

        if (!file.existsSync()) {
            print('File desa.csv tidak ditemukan!');
            return;
        }

        List<String> baris = file.readAsLinesSync();
        for (int i = 0; i < baris.length; i++) {
            List<String> kolom = baris[i].split(',');
            Desa desa = Desa(
                int.parse(kolom[0]),
                kolom[1],
                kolom[2],
                kolom[3],
                kolom[4],
                kolom[5],
            );

            dataDesa.tambahDesa(desa, tampilPesan: false);
        }
    }

    void bacaPengabdian(PenyimpananDesa dataDesa) {
        final file = File('lib/data/pengabdian.csv');

        if (!file.existsSync()) {
            print('File pengabdian.csv tidak ditemukan!');
            return;
        }

        List<String> baris = file.readAsLinesSync();

        for (int i = 0; i < baris.length; i++) {
            List<String> kolom = baris[i].split(',');

            int idDesa = int.parse(kolom[0]);

            JenisPengabdian jenis =
            JenisPengabdian.values.firstWhere(
                (e) => e.name == kolom[2],
            );

            Pengabdian pengabdian = Pengabdian(
                int.parse(kolom[1]),
                jenis,
                kolom[3],
                kolom[4],
            );

            dataDesa.tambahRiwayatPengabdian(
                idDesa,
                pengabdian,
                tampilPesan: false,
            );
        }
    }

    void simpanDesa(PenyimpananDesa dataDesa) {
        final file = File('lib/data/desa.csv');
        List<String> baris = [];

        for (int i = 0; i < dataDesa.listDesa.length; i++) {
            Desa desa = dataDesa.listDesa[i];
            baris.add(
                '${desa.idDesa},'
                '${desa.namaDesa},'
                '${desa.provinsi},'
                '${desa.kabupaten},'
                '${desa.potensi},'
                '${desa.permasalahan}'
            );
        }
        file.writeAsStringSync( baris.join('\n'),);
    }

    void simpanPengabdian(PenyimpananDesa dataDesa) {
        final file = File('lib/data/pengabdian.csv');
        List<String> baris = [];

        for (int i = 0; i < dataDesa.listDesa.length; i++) {
            Desa desa = dataDesa.listDesa[i];
            
            for (int j = 0; j < desa.riwayatPengabdian.length; j++) {
                Pengabdian pengabdian = desa.riwayatPengabdian[j];
                baris.add(
                    '${desa.idDesa},'
                    '${pengabdian.tahun},'
                    '${pengabdian.jenis.name},'
                    '${pengabdian.institusi},'
                    '${pengabdian.deskripsi}'
                );
            }
        }

        file.writeAsStringSync( baris.join('\n'),);
    }
}