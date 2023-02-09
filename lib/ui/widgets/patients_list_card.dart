import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';

class PatientsListCard extends StatelessWidget {
  const PatientsListCard({
    Key? key,
    required this.name,
    required this.info,
  }) : super(key: key);

  final String name, info;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PatientProfile(),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 23,
            ),
            const XMargin(13),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const YMargin(4),
                Text(
                  info,
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
