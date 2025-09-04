import 'package:flutter/material.dart';
import '../models/cat_data.dart';
import '../models/cat_model.dart';
import '../widgets/CatFactWidget.dart';

class CatFactScreen extends StatefulWidget {
  const CatFactScreen({super.key});

  @override
  State<CatFactScreen> createState() => _CatFactScreenState();
}

class _CatFactScreenState extends State<CatFactScreen> {
  CatFact? _catFact;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadFact();
  }

  Future<void> _loadFact() async {
    setState(() => _loading = true);
    try {
      final fact = await getCatFact();
      setState(() => _catFact = fact);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          '🐱 Random Cat Fact',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600 ,color: Colors.white ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _loading && _catFact == null
                      ? const CircularProgressIndicator()
                      : _catFact == null
                      ? const Text(
                    'Press the button to get a cat fact 🐾',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                      : CatFactWidget(
                    fact: _catFact!.fact,
                    length: _catFact!.length,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _loading ? null : _loadFact,
                  icon: const Icon(Icons.refresh ,color: Colors.white,),
                  label: Text(
                    _loading ? 'Loading...' : 'Another Fact!',
                    style: const TextStyle(fontSize: 25 ,color: Colors.white ,fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
