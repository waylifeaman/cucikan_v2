import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cucikan_v2/core/constants/firestore_collection.dart';
import '../models/member_model.dart';
import '../models/outlet_model.dart';

class OutletService {
  OutletService._();

  static final OutletService instance = OutletService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _outlets =>
      _firestore.collection('outlets');

  /// Membuat outlet baru
  Future<void> createOutlet({
    required OutletModel outlet,
    required MemberModel owner,
  }) async {
    try {
      final batch = _firestore.batch();

      final outletRef = _outlets.doc(outlet.id);

      // Simpan outlet
      batch.set(outletRef, outlet.toMap());

      // Tambahkan owner sebagai member pertama
      batch.set(
        outletRef.collection(FirestoreCollection.members).doc(owner.uid),
        owner.toMap(),
      );

      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception('Gagal membuat outlet: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat membuat outlet.');
    }
  }

  /// Mengambil data outlet berdasarkan id
  Future<OutletModel?> getOutlet(String outletId) async {
    try {
      final document = await _outlets.doc(outletId).get();

      if (!document.exists) {
        return null;
      }

      return OutletModel.fromMap(document.data()!);
    } on FirebaseException catch (e) {
      throw Exception('Gagal mengambil data outlet: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat mengambil data outlet.');
    }
  }

  /// Memperbarui data outlet
  Future<void> updateOutlet(OutletModel outlet) async {
    try {
      await _outlets.doc(outlet.id).update(outlet.toMap());
    } on FirebaseException catch (e) {
      throw Exception('Gagal memperbarui data outlet: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat memperbarui data outlet.');
    }
  }

  /// Menghapus outlet
  Future<void> deleteOutlet(String outletId) async {
    try {
      await _outlets.doc(outletId).delete();
    } on FirebaseException catch (e) {
      throw Exception('Gagal menghapus outlet: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat menghapus outlet.');
    }
  }
}
