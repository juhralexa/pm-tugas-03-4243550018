import 'dart:io';

// Struktur data mata kuliah
class MataKuliah {
  String nama;
  int sks;
  String nilai;

  MataKuliah({required this.nama, required this.sks, required this.nilai});
}

// 1. Konversi nilai huruf menjadi bobot angka
double bobot(String huruf) {
  switch (huruf.toUpperCase()) {
    case 'A':
      return 4.0;
    case 'B':
      return 3.0;
    case 'C':
      return 2.0;
    case 'D':
      return 1.0;
    case 'E':
      return 0.0;
    default:
      throw FormatException('Nilai harus A, B, C, D, atau E.');
  }
}

// 2. Validasi SKS
int validasiSks(String input) {
  int? sks = int.tryParse(input);

  if (sks == null || sks <= 0) {
    throw FormatException('SKS harus berupa angka bulat lebih dari 0.');
  }

  return sks;
}

// 3. Validasi nilai
String validasiNilai(String input) {
  String nilai = input.trim().toUpperCase();

  bobot(nilai);

  return nilai;
}

// 4. Menghitung IP menggunakan fold
double hitungIp(List<MataKuliah> data) {
  if (data.isEmpty) return 0.0;

  int totalSks = data.fold(0, (total, mk) => total + mk.sks);

  double totalBobot = data.fold(
    0.0,
    (total, mk) => total + (mk.sks * bobot(mk.nilai)),
  );

  return totalBobot / totalSks;
}

// 5. Menentukan predikat IP
String predikat(double ip) {
  if (ip >= 3.50) {
    return 'Dengan Pujian';
  } else if (ip >= 3.00) {
    return 'Memuaskan';
  } else if (ip >= 2.00) {
    return 'Cukup';
  } else {
    return 'Kurang';
  }
}

// 6. Menampilkan KHS
void cetakKhs(List<MataKuliah> data, {bool urutkan = true}) {
  List<MataKuliah> daftar = List.from(data);

  if (urutkan) {
    daftar.sort((a, b) => bobot(b.nilai).compareTo(bobot(a.nilai)));
  }

  print('\n========== KARTU HASIL STUDI ==========');
  print('No  Mata Kuliah              SKS   Nilai');
  print('---------------------------------------');

  for (int i = 0; i < daftar.length; i++) {
    print(
      '${i + 1}.  ${daftar[i].nama.padRight(24)} '
      '${daftar[i].sks.toString().padRight(5)} '
      '${daftar[i].nilai}',
    );
  }

  int totalSks = data.fold(0, (total, mk) => total + mk.sks);

  double ip = hitungIp(data);

  print('---------------------------------------');
  print('Total SKS    : $totalSks');
  print('IP Semester  : ${ip.toStringAsFixed(2)}');
  print('Predikat     : ${predikat(ip)}');

  // Mencari mata kuliah dengan bobot di bawah 2
  List<MataKuliah> perluDiperbaiki = data
      .where((mk) => bobot(mk.nilai) < 2.0)
      .toList();

  print('\nMata Kuliah yang Perlu Diperbaiki:');

  if (perluDiperbaiki.isEmpty) {
    print('Tidak ada.');
  } else {
    for (var mk in perluDiperbaiki) {
      print('- ${mk.nama} (Nilai ${mk.nilai})');
    }
  }

  print('=======================================\n');
}

// 7. Fungsi utama
void main() {
  List<MataKuliah> daftarMataKuliah = [];

  print('=======================================');
  print('       KALKULATOR IP SEMESTER');
  print('=======================================');
  print('Kosongkan nama mata kuliah untuk selesai.\n');

  while (true) {
    stdout.write('Nama Mata Kuliah: ');
    String nama = stdin.readLineSync()?.trim() ?? '';

    if (nama.isEmpty) {
      break;
    }

    try {
      stdout.write('Jumlah SKS: ');
      String inputSks = stdin.readLineSync()?.trim() ?? '';

      int sks = validasiSks(inputSks);

      stdout.write('Nilai Huruf (A/B/C/D/E): ');
      String inputNilai = stdin.readLineSync()?.trim() ?? '';

      String nilai = validasiNilai(inputNilai);

      daftarMataKuliah.add(MataKuliah(nama: nama, sks: sks, nilai: nilai));

      print('Data berhasil ditambahkan.\n');
    } on FormatException catch (e) {
      print('Input tidak valid: ${e.message}');
      print('Data tidak ditambahkan.\n');
    } catch (e) {
      print('Terjadi kesalahan: $e\n');
    }
  }

  if (daftarMataKuliah.isEmpty) {
    print('\nBelum ada data mata kuliah.');
    return;
  }

  cetakKhs(daftarMataKuliah, urutkan: true);
}
