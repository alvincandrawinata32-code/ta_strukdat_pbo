import 'pengabdian.dart';
import 'data_wilayah.dart';
import 'cetak_data.dart';

class Desa extends DataWilayah implements CetakData  {
    int _idDesa;
    String _namaDesa;
    String _provinsi;
    String _kabupaten;
    String _potensi;
    String _permasalahan;

    List<Pengabdian> _riwayatPengabdian = [];

    Desa(
        this._idDesa,
        this._namaDesa,
        this._provinsi,
        this._kabupaten,
        this._potensi,
        this._permasalahan,
    );

    @override
    int get idDesa => _idDesa;

    @override
    String get namaDesa => _namaDesa;

    String get provinsi => _provinsi;
    String get kabupaten => _kabupaten;
    String get potensi => _potensi;
    String get permasalahan => _permasalahan;
    List<Pengabdian> get riwayatPengabdian => _riwayatPengabdian;

    set namaDesa(String nama) {
        _namaDesa = nama;
    }

    set potensi(String potensi) {
        _potensi = potensi;
    }

    void tambahPengabdian(Pengabdian pengabdian) {
        _riwayatPengabdian.add(pengabdian);
    }

    @override
    void tampilInfo() {
        print('ID Desa        : $_idDesa');
        print('Nama Desa      : $_namaDesa');
        print('Provinsi       : $_provinsi');
        print('Kabupaten      : $_kabupaten');
        print('Potensi        : $_potensi');
        print('Permasalahan   : $_permasalahan');
        print('Jml Pengabdian : ${_riwayatPengabdian.length}');
    }
}