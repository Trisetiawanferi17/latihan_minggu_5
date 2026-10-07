// =============================================================
// Nama   : Feri Tri Setiawan
// NIM    : 202463121007
// Tugas  : Praktikum Flutter Minggu 05 - Penghitung Kehadiran
// File   : lib/penghitung_kehadiran.dart
// =============================================================

import 'package:flutter/material.dart';

/// Batas minimum kehadiran untuk dianggap aman.
const int batasKehadiranAman = 12;

/// Halaman utama penghitung kehadiran.
class HalamanPenghitungKehadiran extends StatefulWidget {
  const HalamanPenghitungKehadiran({super.key});

  @override
  State<HalamanPenghitungKehadiran> createState() =>
      _HalamanPenghitungKehadiranState();
}

class _HalamanPenghitungKehadiranState
    extends State<HalamanPenghitungKehadiran> {
  // ===== State =====
  // Jumlah kehadiran saat ini. Nilai ini yang berubah saat tombol ditekan.
  int _jumlahHadir = 0;

  // ===== Aksi =====
  void _tambahHadir() {
    setState(() {
      _jumlahHadir++;
    });
  }

  void _reset() {
    setState(() {
      _jumlahHadir = 0;
    });
  }

  // ===== Tampilan =====
  @override
  Widget build(BuildContext context) {
    // Warna teks: hijau kalau sudah minimal 12, merah kalau belum.
    final bool sudahAman = _jumlahHadir >= batasKehadiranAman;
    final Color warnaTeks = sudahAman
        ? const Color(0xFF0B6B45) // hijau
        : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Penghitung Kehadiran'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B6B45),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ===== Foto profil dengan border hijau =====
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0B6B45),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/feriturki.jpeg'),
                ),
              ),

              const SizedBox(height: 16),

              // Nama mahasiswa di bawah foto
              const Text(
                'Feri Tri Setiawan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0B6B45),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '202463121007',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 32),

              // Label kecil di atas angka
              const Text(
                'Jumlah kehadiran',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),

              // Angka besar di tengah
              Text(
                '$_jumlahHadir',
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.w700,
                  color: warnaTeks,
                ),
              ),

              const SizedBox(height: 4),

              // Keterangan status
              Text(
                sudahAman
                    ? 'Sudah memenuhi syarat ($batasKehadiranAman pertemuan)'
                    : 'Belum mencapai $batasKehadiranAman pertemuan',
                style: TextStyle(
                  fontSize: 14,
                  color: sudahAman ? const Color(0xFF0B6B45) : Colors.black54,
                  fontWeight: sudahAman ? FontWeight.w600 : FontWeight.normal,
                ),
              ),

              const SizedBox(height: 32),

              // Tombol aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: _tambahHadir,
                    icon: const Icon(Icons.check),
                    label: const Text('Hadir'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF0B6B45),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: _reset,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF0B6B45),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
