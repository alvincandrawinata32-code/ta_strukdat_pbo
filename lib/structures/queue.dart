class QueuePencarian {
    List<String> _riwayatPencarian = [];

    void tambahPencarian(String pencarian) {
        _riwayatPencarian.add(pencarian);
    }

    String? hapusPencarian() {
        if (_riwayatPencarian.isEmpty) {
            return null;
        }

        return _riwayatPencarian.removeAt(0);
    }

    void tampilRiwayatPencarian() {
        print('\nRIWAYAT PENCARIAN');

        if (_riwayatPencarian.isEmpty) {
            print('Belum ada riwayat pencarian!');
            return;
        }

        for (int i = 0; i < _riwayatPencarian.length; i++) {
            print('${i + 1}. ${_riwayatPencarian[i]}');
        }
    }

    void lihatPalingDepan() {
        if (_riwayatPencarian.isEmpty) {
            print('Queue kosong!');
            return;
        }
        print('Paling depan: ${_riwayatPencarian[0]}');
    }

    bool isEmpty() {
        return _riwayatPencarian.isEmpty;
    }

    int jumlahData() {
        return _riwayatPencarian.length;
    }
}