// =============================================================
// Nama   : Feri Tri Setiawan
// NIM    : 202463121007
// Tugas  : Kartu Identitas Digital
// Materi : StatefulWidget, Row, Column, Container, SizedBox
// File   : lib/kartu_identitas.dart
// =============================================================

import 'package:flutter/material.dart';

// =============================================================
// Palet warna untuk kedua mode
// =============================================================
class PaletWarna {
  final Color latarHalaman;
  final Color latarKartu;
  final Color warnaUtama;
  final Color warnaTeks;
  final Color warnaTeksSekunder;
  final Color warnaBorder;

  const PaletWarna({
    required this.latarHalaman,
    required this.latarKartu,
    required this.warnaUtama,
    required this.warnaTeks,
    required this.warnaTeksSekunder,
    required this.warnaBorder,
  });

  /// Mode terang — nuansa putih-hijau.
  static const PaletWarna terang = PaletWarna(
    latarHalaman: Color(0xFFF5F9F6),
    latarKartu: Colors.white,
    warnaUtama: Color(0xFF0B6B45),
    warnaTeks: Colors.black87,
    warnaTeksSekunder: Colors.black54,
    warnaBorder: Color(0xFFE2E8E4),
  );

  /// Mode gelap — nuansa hijau gelap.
  static const PaletWarna gelap = PaletWarna(
    latarHalaman: Color(0xFF121A16),
    latarKartu: Color(0xFF1E2A24),
    warnaUtama: Color(0xFF3DD68C),
    warnaTeks: Colors.white,
    warnaTeksSekunder: Colors.white70,
    warnaBorder: Color(0xFF2E3D36),
  );
}

// =============================================================
// Halaman utama — StatefulWidget
// =============================================================
class HalamanKartuIdentitas extends StatefulWidget {
  const HalamanKartuIdentitas({super.key});

  @override
  State<HalamanKartuIdentitas> createState() => _HalamanKartuIdentitasState();
}

class _HalamanKartuIdentitasState extends State<HalamanKartuIdentitas> {
  // State: apakah kartu sedang dalam mode gelap?
  bool _modeGelap = false;

  // Aksi: balik nilai state, lalu beri tahu Flutter untuk gambar ulang.
  void _gantiTema() {
    setState(() {
      _modeGelap = !_modeGelap;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pilih palet sesuai state.
    final palet = _modeGelap ? PaletWarna.gelap : PaletWarna.terang;

    return Scaffold(
      // Warna latar halaman juga ikut berubah
      backgroundColor: palet.latarHalaman,
      appBar: AppBar(
        title: const Text('Kartu Identitas Digital'),
        centerTitle: true,
        backgroundColor: palet.warnaUtama,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Panggil kartu identitas dengan palet yang sedang aktif.
            KartuIdentitas(palet: palet),

            const SizedBox(height: 24),

            // Tombol ganti tema
            FilledButton.icon(
              onPressed: _gantiTema,
              icon: Icon(_modeGelap ? Icons.light_mode : Icons.dark_mode),
              label: Text(_modeGelap ? 'Mode Terang' : 'Mode Gelap'),
              style: FilledButton.styleFrom(
                backgroundColor: palet.warnaUtama,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Label kecil sebagai indikator mode
            Text(
              _modeGelap
                  ? 'Sedang menampilkan mode gelap'
                  : 'Sedang menampilkan mode terang',
              style: TextStyle(color: palet.warnaTeksSekunder, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// Kartu identitas — StatelessWidget
// =============================================================
class KartuIdentitas extends StatelessWidget {
  final PaletWarna palet;

  const KartuIdentitas({super.key, required this.palet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palet.latarKartu,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palet.warnaBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== Header: logo + nama kampus =====
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: palet.warnaUtama,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KARTU MAHASISWA',
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                        color: palet.warnaUtama,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'UNIVERSITAS WARMADEWA',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: palet.warnaTeks,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Divider(color: palet.warnaBorder, height: 1),
          const SizedBox(height: 20),

          // ===== Foto + identitas utama =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ====== FOTO PROFIL DARI ASSETS ======
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: palet.warnaUtama, width: 2.5),
                ),
                child: const CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/feriturki.jpeg'),
                ),
              ),
              const SizedBox(width: 18),

              // Nama, NIM, prodi
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feri Tri Setiawan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: palet.warnaTeks,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '202463121007',
                      style: TextStyle(
                        fontSize: 14,
                        color: palet.warnaTeksSekunder,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: palet.warnaUtama.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Teknik Komputer',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: palet.warnaUtama,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          Divider(color: palet.warnaBorder, height: 1),
          const SizedBox(height: 16),

          // ===== Tiga baris info =====
          BarisInfo(
            ikon: Icons.email_outlined,
            label: 'Email',
            nilai: 'feritrisetiawan@kampuswarma.ac.id',
            palet: palet,
          ),
          const SizedBox(height: 12),
          BarisInfo(
            ikon: Icons.phone_outlined,
            label: 'Telepon',
            nilai: '+62 812-3456-7890',
            palet: palet,
          ),
          const SizedBox(height: 12),
          BarisInfo(
            ikon: Icons.location_on_outlined,
            label: 'Alamat',
            nilai: 'Jakarta, Indonesia',
            palet: palet,
          ),

          const SizedBox(height: 20),

          // ===== Footer: masa berlaku =====
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: palet.warnaUtama.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified, size: 18, color: palet.warnaUtama),
                const SizedBox(width: 8),
                Text(
                  'Berlaku sampai 31 Agustus 2028',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: palet.warnaUtama,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// Baris info dengan ikon
// =============================================================
class BarisInfo extends StatelessWidget {
  final IconData ikon;
  final String label;
  final String nilai;
  final PaletWarna palet;

  const BarisInfo({
    super.key,
    required this.ikon,
    required this.label,
    required this.nilai,
    required this.palet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: palet.warnaUtama.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(ikon, size: 18, color: palet.warnaUtama),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: palet.warnaTeksSekunder),
              ),
              const SizedBox(height: 2),
              Text(
                nilai,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: palet.warnaTeks,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
