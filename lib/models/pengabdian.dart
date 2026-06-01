import 'pengabdian.dart';

class Pengabdian {
    int _tahun;
    JenisPengabdian _jenis;
    String _institusi;
    String _deskripsi;

    Pengabdian(this._tahun, this._jenis, this._institusi, this._deskripsi);

    int get tahun => _tahun;
    JenisPengabdian get jenis => _jenis;
    String get institusi => _institusi;
    String get deskripsi => _deskripsi;

    set tahun(int tahun) {
        _tahun = tahun;
    }

    set institusi(String institusi) {
        _institusi = institusi;
    }

    void tampilInfo() {
        print('   Tahun      : $_tahun');
        print('   Jenis      : ${_jenis.name}');
        print('   Institusi  : $_institusi');
        print('   Deskripsi  : $_deskripsi');
    }
}

