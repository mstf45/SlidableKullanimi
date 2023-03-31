import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableKullanimi extends StatefulWidget {
  const SlidableKullanimi({Key? key}) : super(key: key);

  @override
  State<SlidableKullanimi> createState() => _SlidableKullanimiState();
}

bool _isFavorite = false;
bool _isEdit = false;
bool _isDelete = false;

class _SlidableKullanimiState extends State<SlidableKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite_rounded,
                          color: _isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isEdit = !_isEdit;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: _isEdit ? Colors.orange : Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isDelete = !_isDelete;
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: _isDelete ? Colors.orange : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: const ListTile(
                    leading: Image(
                      image: AssetImage('assets/mercedes.png'),
                    ),
                    title: Text('Mercedes'),
                    subtitle: Text('1.000.000 TL'),
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
